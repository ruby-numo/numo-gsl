require_relative "../../erbpp_gsl"

class DefineSys < DefineModule

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
     SysFunc
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

end


class SysFunc < GslFunction
  RE = /^gsl_/
  #RE = /^gsl_sf_coupling/

  def self.lookup(h)
    RE =~ h[:func_name]
  end

  PARAM_DESC =
    {
    }
  PARAM_NAMES =
   {
   "double" => %w[csphase],
   "int" => true,
   "size_t" => true,
   "gsl_sf_legendre_t" => true,
   "gsl_mode_t" => true,
   "gsl_sf_mathieu_workspace *"=>true,
  }

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_/,"")
    super(parent,"basic_func",**h)
  end

  class << self
    def lookup(h)
      return false if /^GSL/ =~ h[:func_name]

      case h[:func_name]
      when /_(alloc)|(free)$/
        false
      when /angle_restrict_\w+_e/ # overwrite on *theta
        false
      when /bessel_sequence_Jnu_e/ # overwrite on v[]
        false
      else
        true
      end
    end
  end

end
