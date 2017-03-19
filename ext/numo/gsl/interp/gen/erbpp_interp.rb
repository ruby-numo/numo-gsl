require_relative "parse_interp"
require "erbpp/line_number"

gsl_list = eval(open("gen/func_def.rb").read)
interp_list = []
interp_accel_list = []
interp2d_list = []
spline_list = []
spline2d_list = []
desc = {}

gsl_list.each do |h|
  desc[h[:func_name]] = h[:desc]
end

gsl_list.each do |h|
  if /^gsl_spline/ =~ h[:func_name] && h[:desc].empty?
    h[:desc] = desc[h[:func_name].sub(/_spline/,"_interp")]
  end
end

gsl_list.each do |h|
  case h[:func_name]
  when /^gsl_interp_accel_(\w+)$/
    interp_accel_list << h
  when /^gsl_interp2d_(\w+)$/
    interp2d_list << h
  when /^gsl_interp_(\w+)$/
    interp_list << h
  when /^gsl_spline2d_(\w+)$/
    spline2d_list << h
  when /^gsl_spline_(\w+)$/
    spline_list << h
  else
    $stderr.puts "skip "+h[:func_name]
  end
end


DefLib.new(nil,'lib') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  ErbPP.new(self,"cast_1d_contiguous")
  ErbPP.new(self,"cast_2d_contiguous")

  name = "Interp"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_interp.h gsl/gsl_interp2d.h
                        gsl/gsl_spline.h gsl/gsl_spline2d.h]
  set lib_name: name.downcase

  [
   #["Interp",      "interp",       interp_list],
   ["InterpAccel", "interp_accel", interp_accel_list],
   #["Interp2D",    "interp2d",     interp2d_list],
   ["Spline",      "spline",       spline_list],
   ["Spline2D",    "spline2d",     spline2d_list],
  ].each do |name,base,list|

    DefInterp.new(self,'class') do
      set name: base
      set class_name: name
      set class_var: "c"+name
      set full_class_name: "Numo::GSL::"+name
      set struct: "gsl_"+base

      undef_alloc_func
      init = nil
      list.each do |h|
        check_func(h)
      end
    end

  end
end.run
