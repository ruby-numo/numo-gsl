require_relative "../gen/erbpp_gsl"

fit_list = ErbppGsl.read_func

class DefFit < DefModule
  def lookup(h)
    h[:func_name].sub(/^gsl_/,"")
  end
  def check_func(h)
    if t = lookup(h)
      if File.exist?("tmpl/#{t}.c")
        m = h[:func_name].sub(/^gsl_#{name}_/,"")
        Fit.new(self, t, name:m, **h)
        return true
      end
    end
    $stderr.puts "skip #{h[:func_name]}"
  end
end

class Fit < DefModuleFunction
  def result
    case func_name
    when /_w?(linear|mul)$/
      cls = (name+"_result").split(/_/).map{|x| x.capitalize}.join("")
      set result_class: cls
      "static VALUE c#{cls};\n"+super
    else
      super
    end
  end
  def init_def
    if get(:result_class)
      super+"
    #{struct_def}"
    else
      super
    end
  end
  def struct_def
    vars = get(:args).select{|a| a[0]=="double *"}
    items = vars.map{|a| "\"#{a[1]}\""}.join(",")
    cls = get(:result_class)
    "/*
      Document-class: Numo::GSL::Fit::#{cls}
      */
    c#{cls} = rb_struct_define_under(#{_mod_var},\"#{cls}\",#{items},NULL);"
  end
end

DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Fit"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_fit.h]
  set lib_name: name.downcase

  DefFit.new(self) do
    set name: name.downcase
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    fit_list.each do |h|
      check_func(h)
    end

  end
end.write(ARGV[0])
