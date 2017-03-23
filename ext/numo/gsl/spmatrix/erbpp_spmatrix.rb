require_relative "parse_spmatrix"
require "erbpp/line_number"

gsl_list = eval(open("func_def.rb").read)

class_list = [
 ["Spmatrix","spmatrix",[]],
]

gsl_list.each do |h|
  class_list.each do |name,base,list|
    if /gsl_#{base}_/ =~ h[:func_name]
      list << h
      break
    end
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  #ErbPP.new(self,"cast_1d_contiguous")
  #ErbPP.new(self,"cast_2d_contiguous")
  #ErbPP.new(self,"spmatrix_macro")
  #ErbPP.new(self,"spmatrix_array_check")

  name = "Spmatrix"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_spmatrix.h]
  set lib_name: name.downcase

  class_list.each do |name,base,list|
    DefSpmatrix.new(self,'class') do
      set name: base
      set class_name: name
      set class_var: "c"+name
      set full_class_name: "Numo::GSL::"+name
      set struct: "gsl_"+base.sub(/2d/,"")

      undef_alloc_func
      list.each do |h|
        check_func(h)
      end
    end

  end
end.run
