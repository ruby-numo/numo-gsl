require_relative "../gen/erbpp_gsl"

cdf_methods = ErbppGsl.read_func.select do |h|
  h[:func_name] =~ /^gsl_cdf_(\w+)$/ &&
  h[:func_type] == "double"
end

class DefCdf < DefGslModule
  def lookup(h)
    case h
    when FM(dbl, type:dbl);             "m_DFloat_f_DFloat"
    when FM(*[dbl]*2, type:dbl);        "m_DFloat_f_DFloat_double"
    when FM(*[dbl]*3, type:dbl);        "m_DFloat_f_DFloat_double_x2"
    when FM(uint,dbl, type:dbl);        "m_DFloat_f_UInt_double"
    when FM(uint,dbl,uint, type:dbl);   "m_DFloat_f_UInt_double_uint"
    when FM(uint,dbl,dbl, type:dbl);    "m_DFloat_f_UInt_double_x2"
    when FM(*[uint]*4, type:dbl);       "m_DFloat_f_UInt_uint_x3"
    end
  end
end

DefLib.new do
  set line_number: true
  set erb_dir: "../gen/tmpl"
  set erb_suffix: ".c"

  name = "Cdf"
  set file_name: "gsl_#{name.downcase}.c"
  set include_files: ["gsl/gsl_cdf.h"]
  set lib_name: name.downcase
  set ns_var: "mG"

  DefCdf.new(self) do
    set name: name.downcase
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    cdf_methods.each do |h|
      check_func(h)
    end
  end

end.run
