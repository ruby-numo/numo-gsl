require_relative "../../gen/erbpp2"
require "erbpp/line_number"

gsl_methods = eval(open("gen/func_def.rb").read)
rstat_methods = []
rquantile_methods = []
gsl_methods.each do |h|
  case h[:func_name]
  when /^gsl_rstat_quantile_(\w+)$/
    rquantile_methods << h
  when /^gsl_rstat_(\w+)$/
    rstat_methods << h
  else
    $stderr.puts "skip "+h[:func_name]
  end
end

def find_template(h,tp)
  func_type = h[:func_type]
  arg_types = h[:args].map{|a| a[0]}
  if /_alloc$/ =~ h[:func_name]
    h[:singleton] = true
    h[:func_name] = "new"
    r =
      case arg_types
      when [""], ["void"]
        "c_new_void"
      when ["const double"], ["double"]
        "c_new_double"
      else
        $stderr.puts "skip1 "+h[:func_name]
        nil
      end
    return r
  end
  case arg_types
  when [tp]
    case func_type
    when "double"
      "c_double_f_void"
    when "size_t"
      "c_sizet_f_void"
    when "int"
      "c_void_f_void"
    else
      $stderr.puts "skip "+h[:func_name]
      nil
    end
  when ["const double",tp]
    "c_self_f_DFloat"
  else
    $stderr.puts "skip "+h[:func_name]
    nil
  end
end

DefLib.new(nil,'lib_rstat') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  name = "Rstat"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_rstat.h"]
  set lib_name: name.downcase

  def_class('class') do
    set name: name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_rstat_workspace"

    undef_alloc_func
    rstat_methods.each do |h|
      if t = find_template(h, "gsl_rstat_workspace *")
        m = h[:func_name].sub(/^gsl_rstat_/,"")
        def_method(m, t, **h)
      end
    end
    def_alias("size", "n")
    def_alias("length", "n")
  end

  name = "Quantile"
  def_class('class') do
    set name: "rstat_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Rstat::"+name
    set struct: "gsl_rstat_quantile_workspace"

    undef_alloc_func
    rquantile_methods.each do |h|
      if t = find_template(h, "gsl_rstat_quantile_workspace *")
        m = h[:func_name].sub(/^gsl_rstat_quantile_/,"")
        def_method(m, t, **h)
      end
    end
  end
end.run
