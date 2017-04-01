require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

func_list = ErbppGsl.read_func
ErbppGsl.read_func_pattern(
  [/^gsl_poly_complex_workspace_/, polyws_list=[]],
  [/^gsl_/,                        poly_list=[]],
)

class DefPolyWs < DefGslClass
  def lookup(h)
    case h
    when FM(name:/_workspace_free/);            false
    when FM(name:/_workspace_alloc/);           "c_new_sizet"
    end
  end
end

class DefPoly < DefGslModule
  def lookup(h)
    case h
    when FM(name:/^gsl_poly_eval$/);            "poly_eval"
    when FM(name:/^gsl_poly_eval_derivs$/);     "poly_eval_derivs"
    when FM(name:/^gsl_poly_complex_solve$/);    "poly_complex_solve"
    when FM(name:/^gsl_poly(_complex)?_solve_/); "mod_func_noloop"
    end
  end
end

DefLib.new(nil) do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Poly"
  base = name.downcase
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_poly.h assert.h]
  set lib_name: base

  DefPolyWs.new(self) do
    name = "PolyComplexWorkspace"
    base = "poly_complex_workspace"
    set name: base
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_"+base

    undef_alloc_func
    polyws_list.each do |h|
      check_func(h)
    end
  end

  DefPoly.new(self) do
    name = "Poly"
    base = name.downcase
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    poly_list.each do |h|
      check_func(h)
    end
  end

end.run
