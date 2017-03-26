require_relative "parse_wavelet"
require "erbpp/line_number"

def read_eval(file)
  fn = file % `gsl-config --version`.chomp
  fn = file % "def" unless File.exist?(fn)
  File.exist?(fn) ? eval(open(fn).read) : []
end

def read_func
  read_eval("func_%s.rb")
end

gsl_list = read_func

class_list = [
 ["WaveletWorkspace","wavelet_workspace",[]],
 ["Wavelet","wavelet",[]],
 ["Wavelet2D","wavelet2d",list_2d=[]],
]
gsl_list.each do |h|
  class_list.each do |name,base,list|
    if /gsl_#{base}_/ =~ h[:func_name]
      list << h
      break
    end
    if h[:func_name] == "gsl_wavelet_alloc"
      list_2d << h
    end
  end
end

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
