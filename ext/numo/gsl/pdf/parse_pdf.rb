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

  def check_func(h)
    if t = lookup(h)
      PdfMethod.new(self, t, **h)
    else
      $stderr.puts "skip #{h[:func_name]}"
    end
  end
end

class PdfMethod < DefModuleFunction
  include FuncParser

  PARAM_DESC = {}
  PARAM_NAMES =
    {
     "double" => %w[a b p n mu nu nu1 nu2 sigma sigma_x sigma_y rho zeta],
     "unsigned int" => %w[n n1 n2 t],
     "size_t" => true,
    }

  def initialize(parent,tmpl,**h)
    m = h[:func_name].sub(/^gsl_ran_(\w+[^_])_?pdf$/,'\1')
    super(parent, tmpl, name:m, **h)
    parse_args(h)
    @preproc_code = ""
  end

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
