require_relative "../gen/erbpp_gsl"

class DefDiscrete < DefGslClass
  def lookup(h)
    case h
    when FM(name:"gsl_ran_discrete_preproc");                "c_new_DFloat"
    when FM(name:"gsl_ran_discrete_pdf"); h[:postpose]=true; "c_DFloat_f_SZ"
    end
  end
end
