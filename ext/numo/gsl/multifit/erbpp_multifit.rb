require_relative "../gen/erbpp_gsl"
require "pp"

ErbppGsl.read_func_pattern(
  [/^gsl_multifit_w?linear$/, mfit_list=[]],
  [/^gsl_multifit_linear(_alloc|_free)$/, linws_list=[]],
  [/^gsl_multifit_w?linear/,  linear_list=[]],
  [/^gsl_multifit_nlinear/,   nlinear_list=[]],
)

class DefMultifit < DefGslModule
  def lookup(h)
    fn = h[:func_name].sub(/gsl_/,"")
    return fn if File.exist?("tmpl/#{fn}.c")
  end
end

class DefLinearWorkspace < DefGslClass
  def lookup(h)
    case h
    when FM(szt,szt, name:/_alloc$/);   "c_new_sizet_x2"
    end
  end
end

class MultifitLinear < DefGslModuleFunction
  def _mod_var
    parent.module_var
  end

  def init_def
    case func_name
    when /_linear$/
      super + "
    #{struct_def("LinearResult",%w[c cov chisq])}"
    else
      super
    end
  end

  def struct_def(cls,vars)
    items = vars.map{|v| "\"#{v}\""}.join(",")
    "/*
      Document-class: Numo::GSL::Multifit::LinearResult
      */
    c#{cls} = rb_struct_define_under(#{_mod_var},\"#{cls}\",#{items},NULL);"
  end
end


DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  name = "Multifit"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_multifit.h"]
  set lib_name: name.downcase
  set ns_var: "mG"

  DefMultifit.new(self) do
    mname = "Multifit"
    mbase = "multifit"
    set name: mbase
    set module_name: mname
    set module_var: "m"+mname
    set full_module_name: "Numo::GSL::"+mname

    cname = "LinearWorkspace"
    cbase = "multifit_linear_workspace"

    DefLinearWorkspace.new(self) do
      set name: cbase
      set class_name: cname
      set class_var: "c"+cname
      set full_class_name: "Numo::GSL::#{mname}::"+cname
      set struct: "gsl_#{cbase}"
      set postpose: true
      set ns_var: "m"+mname

      undef_alloc_func
      linws_list.each do |h|
        check_func(h)
      end

      mfit_list.each do |h|
        m = h[:func_name].sub(/^gsl_#{mbase}_/,"")
        t = mbase+"_"+m
        MultifitLinear.new(self, t, name:m, **h)
      end
    end

    linear_list.each do |h|
      check_func(h)
    end
  end

end.write(ARGV[0])
