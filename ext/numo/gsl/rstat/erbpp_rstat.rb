require_relative "../gen/erbpp2"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

ErbppGsl.read_func_pattern(
  [/^gsl_rstat_quantile_(\w+)$/,rquantile_list=[]],
  [/^gsl_rstat_(\w+)$/,         rstat_list=[]],
)

def find_template(h,tp)
  func_type = h[:func_type]
  arg_types = h[:args].map{|a| a[0].sub(/^const /,"")}
  if /This function is now deprecated/m =~ h[:desc]
    $stderr.puts "depricated: #{h[:func_name]}"
    return nil
  end
  case h[:func_name]
  when /_free$/; nil
  when /_alloc$/
    h[:singleton] = true
    h[:name] = "new"
    case arg_types
    when [""], ["void"];      "c_new_void"
    when ["double"];          "c_new_double"
    end
  else
    case arg_types
    when [tp]
      case func_type
      when "double";          "c_double_f_void"
      when "size_t";          "c_sizet_f_void"
      when "int";             "c_void_f_void"
      end
    when ["double",tp]
      h[:postpose] = true;    "c_self_f_DFloat"
    end
  end
end

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  name = "Rstat"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_rstat.h"]
  set lib_name: name.downcase
  set ns_var: "mG"

  def_class do
    set name: name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_rstat_workspace"

    undef_alloc_func
    rstat_list.each do |h|
      if t = find_template(h, "gsl_rstat_workspace *")
        m = h[:name] || h[:func_name].sub(/^gsl_rstat_/,"")
        def_method(m, t, **h)
      else
        $stderr.puts "skip "+h[:func_name]
      end
    end
    def_alias("size", "n")
    def_alias("length", "n")
  end

  name = "Quantile"
  def_class do
    set name: "rstat_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Rstat::"+name
    set struct: "gsl_rstat_quantile_workspace"
    set ns_var: "cRstat"

    undef_alloc_func
    rquantile_list.each do |h|
      if t = find_template(h, "gsl_rstat_quantile_workspace *")
        m = h[:name] || h[:func_name].sub(/^gsl_rstat_quantile_/,"")
        def_method(m, t, **h)
      else
        $stderr.puts "skip "+h[:func_name]
      end
    end
  end
end.run
