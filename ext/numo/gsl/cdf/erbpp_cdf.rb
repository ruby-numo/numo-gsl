require_relative "../gen/erbpp2"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

gsl_list = ErbppGsl.read_func

cdf_methods = gsl_list.select do |h|
  h[:func_name] =~ /^gsl_cdf_(\w+)$/ &&
  h[:func_type] == "double"
end

def find_template(h)
  if /This function is now deprecated/m =~ h[:desc]
    $stderr.puts "depricated: #{h[:func_name]}"
    return nil
  end
  arg_types = h[:args].map{|a| a[0]}
  case arg_types
  when ["double"];                                "m_DFloat_f_DFloat"
  when ["double"]*2;                              "m_DFloat_f_DFloat_double"
  when ["double"]*3;                              "m_DFloat_f_DFloat_double_x2"
  when ["unsigned int","double"];                 "m_DFloat_f_UInt_double"
  when ["unsigned int","double","unsigned int"];  "m_DFloat_f_UInt_double_uint"
  when ["unsigned int","double","double"];        "m_DFloat_f_UInt_double_x2"
  when ["unsigned int"]*4;                        "m_DFloat_f_UInt_uint_x3"
  else
    puts "skipping "+h[:func_name]
  end
end

DefLib.new do
  set erb_dir: "../gen/tmpl"
  set erb_suffix: ".c"

  name = "Cdf"
  set file_name: "gsl_#{name.downcase}.c"
  set include_files: ["gsl/gsl_cdf.h"]
  set lib_name: name.downcase
  set ns_var: "mG"

  def_module do
    set name: name.downcase
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    cdf_methods.each do |h|
      if tmpl = find_template(h)
        m = h[:func_name].sub(/^gsl_cdf_/,"")
        def_method(m, tmpl, **h)
      end
    end
  end

end.run
