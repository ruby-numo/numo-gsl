require_relative "parse_wavelet"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"


gsl_list = ErbppGsl.read_func

class_list = [
 ["WaveletWorkspace","wavelet_workspace",[]],
 ["Wavelet","wavelet",list_1d=[]],
 ["Wavelet2D","wavelet2d",list_2d=[]],
]
ErbppGsl.read_func_pattern(
  *class_list.map{|name,base,list| [/gsl_#{base}_/, list]}
)
list_2d << list_1d.find{|h| h[:func_name]=="gsl_wavelet_alloc"}

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  #ErbPP.new(self,"cast_1d_contiguous")
  #ErbPP.new(self,"cast_2d_contiguous")
  ErbPP.new(self,"wavelet_macro")
  ErbPP.new(self,"wavelet_array_check")

  name = "Wavelet"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_wavelet.h gsl/gsl_wavelet2d.h]
  set lib_name: name.downcase

  class_list.each do |name,base,list|
    DefWavelet.new(self) do
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
