require_relative "../../erbpp_gsl"

class DefineRan < DefineModule

  def check_func_def(h)
    if /These functions are now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    if /This function is now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    [
     RanDirichletPdf,
     RanMultinomialPdf,
     RanPdf,
     #RanDist,
    ].each do |c|
      if c.lookup(h)
        c.new(self,**h)
        return true
      end
    end
    if /pdf$/ =~ h[:func_name]
    $stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    end
    false
  end

end


class RanDist < GslFunction
  RE = /^gsl_ran_/

  PARAM_DESC =
    {
    }
  PARAM_NAMES =
    {
     "double" => %w[csphase],
     "int" => true, #%w[n m i j l kmax lmax nmin nmax size order_min order_max],
     "size_t" => true, #%w[lmax],
     "gsl_rng" => true,
    }

  def initialize(parent,**h)
    @preproc_code = ""
    #meth = h[:meth] = h[:func_name].sub(/^gsl_ran_/,"")
    tmpl = "ran_dist"
    super(parent,tmpl,**h)
  end

  def self.lookup(h)
    if RE =~ h[:func_name]
      case h[:func_name]
      when /discrete/
        false
      when /_pdf$/
        false
      else
        true
      end
    else
      false
    end
  end

end


class RanPdf < GslFunction
  RE = /^gsl_ran_.*_pdf$/

  PARAM_DESC =
    {
    }
  PARAM_NAMES =
    {
     "double" => %w[a b p n mu nu nu1 nu2 sigma sigma_x sigma_y rho zeta],
     "unsigned int" => %w[n n1 n2 t],
     "size_t" => true,
    }

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_ran_/,"")
    tmpl = "sf_basic"
    super(parent,tmpl,**h)
  end

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def self.lookup(h)
    if RE =~ h[:func_name]
      case h[:func_name]
      when /discrete/
        false
      else
        true
      end
    else
      false
    end
  end

  def argument_property(type,name)
    if name == "return"
      {output:true, narray:true, pass: :return}
    elsif /\[\]$/ =~ name
      {input:true, narray:true, pass: :array}
    elsif is_param(type,name)
      {input:true, param:true}
    elsif /\*$/ =~ type
      {output:true, narray:true, pass: :pointer}
    else
      {input:true, narray:true}
    end
  end

end


class RanDirichletPdf < GslFunction
  RE = /^gsl_ran_dirichlet_(ln)?pdf$/

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_ran_/,"")
    tmpl = "dirichlet"
    super(parent,tmpl,**h)
    n_arg(-1)
  end

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def argument_property(type,name)
    if name == "return"
      {output:true, narray:true, pass: :return}
    elsif /\[\]$/ =~ name
      {input:true, narray:true, pass: :array}
    elsif name == "K"
      {}
    end
  end
end


class RanMultinomialPdf < GslFunction
  RE = /^gsl_ran_multinomial_(ln)?pdf$/

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_ran_/,"")
    tmpl = "multinomial"
    super(parent,tmpl,**h)
    n_arg(-1)
  end

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  def argument_property(type,name)
    if name == "return"
      {output:true, narray:true, pass: :return}
    elsif /\[\]$/ =~ name
      {input:true, narray:true, pass: :array}
    elsif name == "K"
      {}
    end
  end
end
