require_relative "../../erbpp_gsl"

class DefineCdf < DefineModule

  def check_func_def(h)
    if /These functions are now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    if /This function is now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    a = [
     RanCdf,
    ]
    a.each do |c|
      if c.lookup(h)
        c.new(self,**h)
        return true
      end
    end
    #$stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    false
  end
end

class RanCdf < GslFunction
  RE = /^gsl_cdf_/

  PARAM_DESC =
    {
    }
  PARAM_NAMES =
    {
     "double" => %w[a b p mu nu nu1 nu2 sigma zeta],
     "unsigned int" => %w[n n1 n2 t],
     "size_t" => true,
    }

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_cdf_/,"")
    tmpl = "cdf"
    super(parent,tmpl,**h)
  end

  def self.lookup(h)
    RE =~ h[:func_name]
  end
end
