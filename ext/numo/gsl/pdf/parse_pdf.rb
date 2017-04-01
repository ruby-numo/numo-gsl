require_relative "../gen/erbpp_gsl"

class DefPdf < DefGslModule
  def lookup(h)
    case h
    when FM(name:/_dirichlet_(ln)?pdf$/);       "dirichlet"
    when FM(name:/_multinomial_(ln)?pdf$/);     "multinomial"
    when FM(name:/_discrete_pdf$/);             false
    when FM(name:/_multivariate_gaussian(_log)?_pdf$/); false
    when FM(name:/_pdf$/);                      "mod_func_noloop"
    end
  end

  def define_method(t,**h)
    PdfMethod.new(self, t, **h)
  end

  def to_method_name(s)
    s.sub(/^gsl_ran_(\w+[^_])_?pdf$/,'\1')
  end
end

class PdfMethod < DefGslModuleFunction

  PARAM_DESC = {}
  PARAM_NAMES =
    {
     "double" => %w[a b p n mu nu nu1 nu2 sigma sigma_x sigma_y rho zeta],
     "unsigned int" => %w[n n1 n2 t],
     "size_t" => true,
    }

  def argument_property(type,name)
    if    name == "return";     {output:true, narray:true, pass: :return}
    elsif name == "K";          {} # ignore array size
    elsif /\[\]$/ =~ name;      {input:true, narray:true, pass: :array}
    elsif is_param(type,name);  {input:true, param:true}
    elsif /\*$/ =~ type;        {output:true, narray:true, pass: :pointer}
    else;                       {input:true, narray:true}
    end
  end
end
