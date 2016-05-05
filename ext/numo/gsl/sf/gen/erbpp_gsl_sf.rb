require_relative "../../erbpp_gsl"

class DefineModule < ErbPP

  def initialize(erb_path)
    super(nil, erb_path)
    @mod_var = "mM"
    @tmpl_dir = File.join(File.dirname(erb_path),"tmpl")
  end

  attr_reader :tmpl_dir

  define_attrs %w[
    m_prefix
    mod_var
    class_name
    desc
  ]

  def class_alias(*args)
    @class_alias.concat(args)
  end

  def check_gsl_sf(h)
    if /These functions are now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    if /This function is now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    a = [
     LegendreArray,
     MathieuArray,
     BesselArray,
     CoulombArray,
     GegenpolyArray,
     SfBasic
    ]
    a.each do |c|
      if c.lookup(h)
        c.new(self,**h)
        return true
      end
    end
    $stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    false
  end

  def load_sf_def(file)
    str = open(file,"r").read
    ary = eval(str)
    ary.each{|h| check_gsl_sf(h)}
  end

end


class SfBasic < GslFunction
  RE = /^gsl_sf_/
  #RE = /^gsl_sf_coupling/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  PARAM_DESC =
    {
     "norm"=>"@param [Integer] norm Type of normalization to use. The possible values are: Numo::GSL::Sf::Legendre::NONE, Numo::GSL::Sf::Legendre::SCHMIDT, Numo::GSL::Sf::Legendre::SPHARM, Numo::GSL::Sf::Legendre::FULL",
     "mode"=>"@param [Integer] mode  The following precision levels are available: Numo::GSL::PREC_DOUBLE, Numo::GSL::PREC_SINGLE, Numo::GSL::PREC_APPROX.",
     "lmax"=>"@param [Integer] lmax",
     "csphase"=>"@param [Float] csphase  To include or exclude the Condon-Shortley phase factor of (-1)^m, set the parameter csphase to either -1 or 1 respectively.",
     "work"=>"@param [Numo::GSL::Sf::MathieuWorkspace] work",
    }
  PARAM_NAMES =
   {
   "double" => %w[csphase],
   "int" => true, #%w[n m i j l kmax lmax nmin nmax size order_min order_max],
   "size_t" => true, #%w[lmax],
   "gsl_sf_legendre_t" => true,
   "gsl_mode_t" => true,
   "gsl_sf_mathieu_workspace *"=>true,
  }

  def initialize(parent,**h)
    @preproc_code = ""
    h[:method] = h[:func_name].sub(/^gsl_sf_/,"")
    super(parent,"sf_basic",**h)
  end

  class << self
    def lookup(h)
      #return /airy/ =~ h[:func_name]
      case h[:func_name]
      when /_(alloc)|(free)$/
        false
      #when /coulomb/
      #  false
      when /angle_restrict_\w+_e/ # overwrite on *theta
        false
      when /bessel_sequence_Jnu_e/ # overwrite on v[]
        false
      #when /gegenpoly_array/
      #  false
      else
        true
      end
    end
  end

end


class MathieuArray < SfBasic
  RE = /^gsl_sf_mathieu_\w+_array$/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def initialize(parent,**h)
    super(parent,**h)

    case c_method
    when /_(a|b)_array$/
      @mathieu_type = :characteristic
    when /_(c|s)e_array$/
      @mathieu_type = :angular
    when /_M(c|s)_array$/
      @mathieu_type = :radial
    end

    if @mathieu_type == :radial
      @preproc_code = <<EOL
    if (c0!=1 || c0!=2) {
        rb_raise(rb_eArgError,"j should be 1 or 2");
    }
    if (c1<0 || c2<0 || c1>c2) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = c2-c1+1;
EOL
      else
        @preproc_code = <<EOL
    if (c0<0 || c1<0 || c0>c1) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = c1-c0+1;
EOL
    end
  end
end


class BesselArray < SfBasic
  RE = /^gsl_sf_bessel_\w+_array$/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def initialize(parent,**h)
    super(parent,**h)
    if n_arg == 3
      @preproc_code = <<EOL
    if (c0<0 || c1<0 || c0>c1) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = c1-c0+1;
EOL
    else
      @preproc_code = <<EOL
    if (c0<0) {
        rb_raise(rb_eArgError,"should be lmax>=0");
    }
    shape[0] = c0+1;
EOL
    end
  end
end


class CoulombArray < SfBasic
  RE = /^gsl_sf_coulomb_\w+_array$/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def initialize(parent,**h)
    super(parent,**h)
    c = find_name("kmax").c_var
    @preproc_code = <<EOL
    if (#{c}<0) {
        rb_raise(rb_eArgError,"should be kmax>=0");
    }
    shape[0] = #{c}+1;
EOL
  end
end


class GegenpolyArray < SfBasic
  RE = /^gsl_sf_gegenpoly_array$/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def initialize(parent,**h)
    super(parent,**h)
    c = find_name("nmax").c_var
    @preproc_code = <<EOL
    if (#{c}<0) {
        rb_raise(rb_eArgError,"should be kmax>=0");
    }
    shape[0] = #{c}+1;
EOL
  end
end


class LegendreArray < SfBasic
  RE = /^gsl_sf_legendre\w*_array(_e)?$/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def initialize(parent,**h)
    super(parent,**h)
    c = find_name("lmax").c_var
    @preproc_code = "    shape[0] = gsl_sf_legendre_array_n(#{c});"
  end
end
