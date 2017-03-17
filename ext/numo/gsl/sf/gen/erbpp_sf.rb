require_relative "../../gen/erbpp2"
require_relative "parse_sf"
require "erbpp/line_number"

gsl_list = eval(open("gen/func_def.rb").read)
sf_list = []
mathieu_list = []
gsl_list.each do |h|
  if h[:args].any?{|a| a[0] == "gsl_sf_mathieu_workspace *"}
    mathieu_list << h
  else
    case h[:func_name]
    when /^gsl_sf_(\w+)$/
      sf_list << h
    else
      $stderr.puts "skip "+ h[:func_name]
    end
  end
end

def find_c_template(h,tp)
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
    when ["size_t","double"]; "c_new_sizet_double"
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

DefLib.new(nil,'lib') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Sf"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_sf.h"]
  set lib_name: "sf"

  DefSfModule.new(self,'module') do
    set name: "sf"
    set module_name: "Sf"
    set module_var: "mSf"
    set full_module_name: "Numo::GSL::Sf"

    sf_list.each do |h|
      check_func(h)
    end
  end

  name = "Mathieu"
  def_class('class') do
    set ns_var: "mSf"
    set name: "sf_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Sf::"+name
    set struct: "gsl_sf_mathieu_workspace"

    undef_alloc_func
    mathieu_list.each do |h|
      if t = find_c_template(h, "gsl_sf_mathieu_workspace *")
        m = h[:name] || h[:func_name].sub(/^gsl_sf_mathieu_/,"")
        def_method(m, t, **h)
      else
        $stderr.puts "skip "+h[:func_name] if /_e$/ !~ h[:func_name]
      end
    end
  end
end.run
