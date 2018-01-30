require_relative "../gen/erbpp_gsl"
require_relative "parse_spmatrix"

class_list = [
 ["SpMatrix","spmatrix",[]],
 ["SpBlas","spblas",[]],
 ["IterSolve","splinalg_itersolve",[]],
]
list = {}
ErbppGsl.read_func_pattern(*class_list.map{|name,base|
  [/gsl_#{base}_/, list[name]=[]]
})
const_list = ErbppGsl.read_const

DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  ErbPP.new(self,"cast_1d_contiguous")
  ErbPP.new(self,"cast_2d_contiguous")

  cname = "SpMatrix"
  cbase = cname.downcase
  set file_name: "gsl_#{cname}.c"
  set include_files: %w[gsl/gsl_spmatrix.h gsl/gsl_spblas.h gsl/gsl_splinalg.h]
  set lib_name: cname.downcase

  DefSpMatrix.new(self) do
    name = cname
    base = cbase
    set name: base
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_"+base

    const_list.each do |a|
      m = a[0].sub(/^GSL_SPMATRIX_/,"")
      v = "INT2FIX(#{a[0]})"
      def_const(m, v, desc:a[1]||"")
    end

    undef_alloc_func
    list[name].each do |h|
      check_func(h)
    end
  end

  DefSpBlas.new(self) do
    name = "SpBlas"
    base = name.downcase
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name
    set struct: "gsl_spmatrix"

    set class_name: cname
    set class_var: "c"+cname
    set full_class_name: "Numo::GSL::"+cname
    set data_type_var: cbase+"_data_type"

    def_const "NOTRANS", "INT2FIX(CblasNoTrans)"
    def_const "TRANS", "INT2FIX(CblasTrans)"

    list[name].each do |h|
      check_func(h)
    end
  end

  def_module do
    name = "SpLinalg"
    base = name.downcase
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    DefIterSolve.new(self) do
      set ns_var: "mSpLinalg"
      name = "IterSolve"
      base = "splinalg_itersolve"
      set name: base
      set class_name: name
      set class_var: "c"+name
      set full_class_name: "Numo::GSL::SpLinalg::"+name
      set struct: "gsl_"+base

      set sm_struct: "gsl_"+cbase
      set sm_data_type_var: cbase+"_data_type"

      undef_alloc_func
      list[name].each do |h|
        check_func(h)
      end
    end
  end

end.run
