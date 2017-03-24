require_relative "parse_spmatrix"
require "erbpp/line_number"

gsl_list = eval(open("func_def.rb").read)

class_list = [
 ["SpMatrix","spmatrix",[]],
 ["SpBlas","spblas",[]],
]
list = {}
class_list.each do |name,base|
  list[name] = []
end
gsl_list.each do |h|
  class_list.each do |name,base|
    if /gsl_#{base}_/ =~ h[:func_name]
      list[name] << h
      break
    end
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  ErbPP.new(self,"cast_1d_contiguous")
  ErbPP.new(self,"cast_2d_contiguous")
  ErbPP.new(self,"spmatrix_macro")
  #ErbPP.new(self,"spmatrix_array_check")

  name = cname = "SpMatrix"
  base = cbase = name.downcase
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_spmatrix.h gsl/gsl_spblas.h]
  set lib_name: name.downcase

  DefSpMatrix.new(self,'class') do
    set name: base
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_"+base

    def_const "TRIPLET","INT2FIX(GSL_SPMATRIX_TRIPLET)",desc:"triplet storage"
    def_const "CCS","INT2FIX(GSL_SPMATRIX_CCS)",desc:"compressed column storage"
    #def_const "CRS","INT2FIX(GSL_SPMATRIX_CRS)",desc:"compressed row storage"

    undef_alloc_func
    list[name].each do |h|
      check_func(h)
    end
  end

  name = "SpBlas"
  base = name.downcase

  DefSpBlas.new(self,'module') do
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

    #undef_alloc_func
    list[name].each do |h|
      check_func(h)
    end
  end

end.run
