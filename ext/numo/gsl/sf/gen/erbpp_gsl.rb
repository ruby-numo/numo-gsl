require 'erbpp'


class Argument

  def description
    @func.param_desc[@name] ||
      if @param
        "@param [#{rb_class}] #{@name}"
      elsif @narray
        "@param [#{na_class}] #{@name}"
      end
  end

  NUM2DATA =
    {
     "double"=>"%2 = NUM2DBL(%1)",
     "int"=>"%2 = NUM2INT(%1)",
     "unsigned int"=>"%2 = NUM2UINT(%1)",
     "size_t"=>"%2 = NUM2SIZE(%1)",
     "gsl_mode_t"=>"%2 = NUM2INT(%1)",
     "gsl_sf_legendre_t"=>"%2 = NUM2INT(%1)",
     "gsl_sf_mathieu_workspace *"=>'
    if (rb_obj_is_kind_of(%1,cWorkspace)!=Qtrue) {
        rb_raise(rb_eTypeError,"last argument must be "
                 "Numo::GSL::Sf::MathieuWorkspace class");
    }
    TypedData_Get_Struct(%1, gsl_sf_mathieu_workspace, &mathieuws_type, %2)'
    }

  DATA2NUM =
    {
     "double"=>"DBL2NUM(%1)",
     "int"=>"INT2NUM(%1)",
     "unsigned int"=>"UINT2NUM(%1)",
     "size_t"=>"SIZE2NUM(%1)",
     "gsl_sf_result *"=>["DBL2NUM(%1.val)","DBL2NUM(%1.err)"]
    }

  TYPEMAP =
    {
     "double"=>"cDF",
     "unsigned int"=>"cUI",
     "int"=>"cI",
     "size_t"=>"cSZ"
    }

  NACLASSMAP =
    {
     "double"=>"Numo::DFloat",
     "unsigned int"=>"Numo::UInt32",
     "int"=>"Numo::Int32",
     "size_t"=>"Numo::UInt64",
     "gsl_sf_result *"=>["Numo::DFloat"]*2,
     "gsl_sf_result_e10 *"=>["Numo::DFloat"]*2+["Numo::Int32"],
     "gsl_sf_mathieu_workspace *"=>"Numo::GSL::Sf::MathieuWorkspace"
    }

  RBCLASSMAP =
    {
     "double"=>"Float",
     "unsigned int"=>"Integer",
     "int"=>"Integer",
     "size_t"=>"Integer",
     "gsl_mode_t"=>"Integer"
    }

  CTYPEMAP =
    {
     "double"=>"double",
     "unsigned int"=>"uint32_t",
     "int"=>"int32_t",
     "size_t"=>"uint64_t"
    }

  RETNAMEMAP =
    {
     "double"=>"Numo::DFloat",
     "unsigned int"=>"Numo::UInt32",
     "int"=>"Numo::Int32",
     "size_t"=>"Numo::UInt64",
     "gsl_sf_result *"=>["Numo::DFloat"]*2,
     "gsl_sf_result_e10 *"=>["Numo::DFloat"]*2+["Numo::Int32"]
    }

  def initialize(func,idx,type,name)
    @func = func
    @idx  = idx
    @type = type.sub(/^const\s+/,"").strip
    @name = name

    if /_array$/ =~ @name && /(.+)\*$/ =~ @type
      @type = $1.strip
      @name = @name+"[]"
    end

    if @name == "return"
      @input = false
      @output = true
      @param = false
      @narray = true
      @pass = :return
    elsif /\[\]$/ =~ @name
      @input = false
      @output = true
      @param = false
      @narray = true
      @pass = :array
    elsif func.is_param(@type,@name)
      @input = true
      @output = false
      @param = true
      @narray = false
    elsif /(.+)\*$/ =~ @type
      @type2 = $1.strip
      @input = false
      @output = true
      @param = false
      @narray = true
      @pass = :pointer
    else
      @input = true
      @output = false
      @param = false
      @narray = true
    end

    if @output
      if @type == "gsl_sf_result_e10 *"
        @n_out = 3
      elsif @type == "gsl_sf_result *"
        @n_out = 2
      else
        @n_out = 1
      end
    end

    @ctype = CTYPEMAP[@type] || CTYPEMAP[@type2]
  end

  attr_reader :type,:name
  attr_reader :input,:output,:param,:narray
  attr_reader :pass, :n_out

  def c_var
    "c#{@idx}"
  end

  def c_arg
    (@pass == :pointer) ? "&"+c_var : c_var
  end

  def v_var
    if @func.varg
      "v[#{@idx}]"
    else
      "v#{@idx}"
    end
  end

  def ain_def
    "{#{na_type},0}"
  end

  def aout_def
    if @type == "gsl_sf_result_e10 *"
      return "{cDF,0},{cDF,0},{cI,0}"
    elsif @type == "gsl_sf_result *"
      return "{cDF,0},{cDF,0}"
    end
    case @pass
    when :array
      "{#{na_type},1,shape}"
    when :pointer,:return
      "{#{na_type},0}"
    else
      raise "no aout_def for #{self.inspect}"
    end
  end

  def na_type
    TYPEMAP[@type] || TYPEMAP[@type2]
  end

  def na_class
    NACLASSMAP[@type] || NACLASSMAP[@type2]
  end

  def rb_class
    RBCLASSMAP[@type] || RBCLASSMAP[@type2]
  end

  def ret_val
    case @type
    when "gsl_sf_result *"
      [@name+".val",@name+".err"]
    when "gsl_sf_result_e10 *"
      [@name+".val",@name+".err",@name+".e10"]
    else
      @name
    end
  end

  def def_var
    if @param
      "#{@type} #{c_var};"
    elsif @input
      "#{@type} #{c_var};"
    elsif @pass == :array
      "#{@type} *#{c_var};"
    elsif @pass == :pointer
      "#{@type2} #{c_var};"
    elsif @pass == :return
      "#{@type} #{c_var};"
    else
      raise "no variable definition"
    end
  end

  def def_value
    "VALUE #{v_var};"
  end

  def set_value
    NUM2DATA[@type].gsub(/%1/,v_var).sub(/%2/,c_var)+";"
  end

  def get_value
    case a = DATA2NUM[@type]
    when String
      a.gsub(/%1/,c_var)
    when Array
      a.map{|s| s.gsub(/%1/,c_var)}
    end
  end

  def store_to_array(va)
    a = get_value
    a = [a] unless Array === a
    a.map{|x|"rb_ary_push(#{va},#{x});"}.join("\n"+" "*8)
  end

  def set_param(opt)
    n = @func.n_input
    if @type == "gsl_mode_t" && n == @idx+1
      return <<EOL
    if (argc==#{@idx}) {
        #{c_var} = GSL_MODE_DEFAULT;
    } else if (argc==#{@idx+1}) {
        #{set_value}
    } else {
        rb_raise(rb_eArgError,"invalid number of argument: %d for #{n-1} or #{n}",argc);
    }
    #{opt} = &#{c_var}; //#{@name}
EOL
    else
      return <<EOL
    #{set_value}
    #{opt} = &#{c_var}; //#{@name}
EOL
    end
  end

  def get_param(opt)
    "#{c_var} = *(#{@type}*)(#{opt}); //#{@name}"
  end

  def get_data(lp)
    "#{c_var} = *(#{@ctype}*)GET_PTR(#{lp},#{cnt}); //#{@name}"
  end

  def get_ptr(lp)
    if @pass == :array
      "#{c_var} = (#{@ctype}*)GET_PTR(#{lp},#{cnt}); //#{@name}"
    end
  end

  def set_data(lp)
    if @pass != :array
      if "gsl_sf_result_e10 *" == @type
        "*(double*)GET_PTR(#{lp},#{cnt}) = #{c_var}.val; "+
        "*(double*)GET_PTR(#{lp},#{cnt}) = #{c_var}.err; "+
        "*(int32_t*)GET_PTR(#{lp},#{cnt}) = #{c_var}.e10; //#{@name}"
      elsif "gsl_sf_result *" == @type
        "*(double*)GET_PTR(#{lp},#{cnt}) = #{c_var}.val; "+
        "*(double*)GET_PTR(#{lp},#{cnt}) = #{c_var}.err; //#{@name}"
      else
        "*(#{@ctype}*)GET_PTR(#{lp},#{cnt}) = #{c_var}; //#{@name}"
      end
    end
  end

  def cnt
    @func.counter.inc
  end
end

#----------------------------------------------------------

class Counter
  def initialize
    @i = 0
  end
  def inc
    i = @i
    @i += 1
    i
  end
end

class GslSfFunction < Function
  RE = /^ no match $/

  class << self
    def lookup(h)
      self::RE =~ h[:func_name]
    end
  end

  PARAM_DESC =
    {
     "norm"=>"@param [Integer] norm Type of normalization to use. The possible values are: Numo::GSL::Sf::Legendre::NONE, Numo::GSL::Sf::Legendre::SCHMIDT, Numo::GSL::Sf::Legendre::SPHARM, Numo::GSL::Sf::Legendre::FULL",
     "mode"=>"@param [Integer] mode  The following precision levels are available: Numo::GSL::PREC_DOUBLE, Numo::GSL::PREC_SINGLE, Numo::GSL::PREC_APPROX.",
     "lmax"=>"@param [Integer] lmax",
     "csphase"=>"@param [Float] csphase  To include or exclude the Condon-Shortley phase factor of (-1)^m, set the parameter csphase to either -1 or 1 respectively.",
     "work"=>"@param [Numo::GSL::Sf::MathieuWorkspace] work",
    }

  def param_desc
    self.class::PARAM_DESC
  end

  def desc_param
    t = (["Numo::DFloat"]*n_out).join(",")
    t = @args_out.map{|a| a.na_class}.flatten.join(", ")
    v = @args_out.map{|a| a.ret_val}.flatten.join(", ")
    if n_out > 1
      r = "@return [[#{t}]]  array of [#{v}]"
    else
      r = "@return [#{t}]  #{v}"
    end
    @args_input.map{|a| a.description}+[r]
  end

  PARAM_NAMES =
  {
   "double" => %w[csphase],
   "int" => true, #%w[n m i j l kmax lmax nmin nmax size order_min order_max],
   "size_t" => true, #%w[lmax],
   "gsl_sf_legendre_t" => true,
   "gsl_mode_t" => true,
   "gsl_sf_mathieu_workspace *"=>true,
  }

  def param_names
    self.class::PARAM_NAMES
  end

  def is_param(tp,nm)
    #$stderr.puts "type='#{tp}' name='#{nm}'"
    case a = self.class::PARAM_NAMES[tp]
    when Array
      a.include?(nm)
    else
      a
    end
  end

  def parse_args(h)
    @parsed_args = h[:args].map.with_index do |x,i|
      Argument.new(self,i,x[0],x[1])
    end
    t = h[:func_type]
    if t != "void"
      i = @parsed_args.size
      r = Argument.new(self,i,t,"return")
      @parsed_args << r
    end
  end

  def initialize(parent,tmpl,**h)
    parse_args(h)
    @args_param = @parsed_args.select{|a|a.param}
    @args_input = @parsed_args.select{|a|a.input}
    @args_in = @parsed_args.select{|a|a.narray && a.input}
    @args_out = @parsed_args.select{|a|a.narray && a.output}
    if @args_param.any?{|a| a.type=="gsl_mode_t"}
      @varg = -1
      n_arg(-1)
    else
      @varg = nil
      n_arg(@args_param.size+@args_in.size)
    end
    @parsed_args.each do |a|
      if a.pass == :array
        @generate_array = true
        break
      end
    end
    if @args_in.empty?
      tmpl = "sf_scalar"
    end
    @name = h[:func_name]
    super(parent,tmpl,
          singleton:true,
          c_method:@name,
          method:@name.sub(/^gsl_sf_/,""),
          **h)
    @counter = Counter.new
  end

  attr_reader :name
  attr_reader :args_out, :args_in, :args_param, :varg
  attr_reader :generate_array

  def n_param
    @args_param.size
  end

  def n_in
    @args_in.size
  end

  def n_input
    @args_input.size
  end

  def n_out
    n = 0
    @args_out.each{|a| n+=a.n_out}
    n
  end

  def def_ain
    @args_in.map{|a| a.ain_def}.join(",")
  end

  def def_aout
    @args_out.map{|a| a.aout_def}.join(",")
  end

  def find_name(name)
    @parsed_args.find{|a| a.name==name}
  end

  def c_args
    @parsed_args.select{|a| a.pass != :return}.
      map{|a| a.c_arg}.join(",")
  end

  def recv
    a = args_out.last
    if a && a.pass == :return
      a.c_var + " = "
    else
      ""
    end
  end

  def method_args
    s = @args_input.map{|a| a.name}.join(",")
    s.sub(/,mode$/,",[mode]")
  end

  def cdef_args
    if @varg
      "int argc, VALUE *v, VALUE mod"
    else
      "VALUE mod," +
        @args_input.map{|a|"VALUE #{a.v_var}"}.join(",")
    end
  end

  def ndl_args
    @args_in.map{|a| a.v_var}.join(",")
  end

end


class MathieuArray < GslSfFunction
  RE = /^gsl_sf_mathieu_\w+_array$/

  def initialize(parent,**h)
    super(parent,"sf_basic",**h)

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


class BesselArray < GslSfFunction
  RE = /^gsl_sf_bessel_\w+_array$/

  def initialize(parent,**h)
    super(parent,"sf_basic",**h)
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


class CoulombArray < GslSfFunction
  RE = /^gsl_sf_coulomb_\w+_array$/

  def initialize(parent,**h)
    super(parent,"sf_basic",**h)
    c = find_name("kmax").c_var
    @preproc_code = <<EOL
    if (#{c}<0) {
        rb_raise(rb_eArgError,"should be kmax>=0");
    }
    shape[0] = #{c}+1;
EOL
  end
end


class GegenpolyArray < GslSfFunction
  RE = /^gsl_sf_gegenpoly_array$/

  def initialize(parent,**h)
    super(parent,"sf_basic",**h)
    c = find_name("nmax").c_var
    @preproc_code = <<EOL
    if (#{c}<0) {
        rb_raise(rb_eArgError,"should be kmax>=0");
    }
    shape[0] = #{c}+1;
EOL
  end
end


class LegendreArray < GslSfFunction
  RE = /^gsl_sf_legendre\w*_array(_e)?$/

  def initialize(parent,**h)
    super(parent,"sf_basic",**h)
    c = find_name("lmax").c_var
    @preproc_code = "    shape[0] = gsl_sf_legendre_array_n(#{c});"
  end
end


class SfBasic < GslSfFunction
  RE = /^gsl_sf_/
  #RE = /^gsl_sf_coupling/

  def initialize(parent,**h)
    @preproc_code = ""
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


module DefMethod

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

# ----------------------------------------------------------------------

class DefineModule < ErbPP

  include DefMethod

  def initialize(erb_path, type_file=nil)
    super(nil, erb_path)
    @class_alias = []
    @upcast = []
    @mod_var = "mM"
    @tmpl_dir = File.join(File.dirname(erb_path),"tmpl")
    load_type(type_file) if type_file
  end

  attr_reader :tmpl_dir

  def load_type(file)
    eval File.read(file)
  end

  attrs = %w[
    m_prefix
    mod_var
    class_name
    desc
  ]
  define_attrs attrs

  def class_alias(*args)
    @class_alias.concat(args)
  end

end
