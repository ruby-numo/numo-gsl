require_relative "../gen/erbpp_gsl"

class DefDiscrete < DefClass
  include ErbppGsl

  def lookup(h)
    case h
    when FM(name:"gsl_ran_discrete_preproc");                "c_new_DFloat"
    when FM(name:"gsl_ran_discrete_pdf"); h[:postpose]=true; "c_DFloat_f_SZ"
    end
  end

  def check_func(h)
    if t = lookup(h)
      m = h[:func_name].sub(/^gsl_ran_discrete_/,"")
      DefMethod.new(self, t, name:m, **h)
    else
      $stderr.puts "skip #{h[:func_name]}"
    end
  end
end
