require_relative "../gen/erbpp2"
require "erbpp/line_number"

def read_eval(file)
  fn = file % `gsl-config --version`.chomp
  fn = file % "def" unless File.exist?(fn)
  File.exist?(fn) ? eval(open(fn).read) : []
end

def read_func
  read_eval("func_%s.rb")
end

hist_list =
[
 {func_name:"gsl_histogram_n",func_type:"size_t",args:[["struct",""]]},
 {func_name:"gsl_histogram_range",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram_bin",func_type:"double *",args:[["struct",""]]},
]
hist_pdf_list =
[
 {func_name:"gsl_histogram_pdf_n",func_type:"size_t",args:[["struct",""]]},
 {func_name:"gsl_histogram_pdf_range",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram_pdf_sum",func_type:"double *",args:[["struct",""]]},
]
hist2d_list =
[
 #{func_name:"gsl_histogram2d_nx",func_type:"size_t",args:[["struct",""]]},
 #{func_name:"gsl_histogram2d_ny",func_type:"size_t",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_xrange",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_yrange",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_bin",func_type:"double *",args:[["struct",""]]},
]
hist2d_pdf_list =
[
 {func_name:"gsl_histogram2d_pdf_nx",func_type:"size_t",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_pdf_ny",func_type:"size_t",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_pdf_xrange",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_pdf_yrange",func_type:"double *",args:[["struct",""]]},
 {func_name:"gsl_histogram2d_pdf_sum",func_type:"double *",args:[["struct",""]]},
]

read_func.each do |h|
  h[:desc].gsub!(/\/\*/,"//")
  h[:desc].gsub!(/\*\//,"")
  case h[:func_name]
  when /^gsl_histogram2d_pdf_(\w+)$/
    hist2d_pdf_list << h
  when /^gsl_histogram2d_(\w+)$/
    hist2d_list << h
  when /^gsl_histogram_pdf_(\w+)$/
    hist_pdf_list << h
  when /^gsl_histogram_(\w+)$/
    hist_list << h
  else
    $stderr.puts "skip "+h[:func_name]
  end
end


def find_template(h,tp)
  if /This function is now deprecated/m =~ h[:desc]
    $stderr.puts "depricated: #{h[:func_name]}"
    return nil
  end
  func_type = h[:func_type]
  arg_types = h[:args].map{|a| a[0].sub(/^const /,"")}
  h[:postpose] = false
  case h[:func_name].sub(/gsl_histogram/,"")
  when /_free$/; nil
  when /_alloc$/
    h[:singleton] = true
    h[:name] = "new"
    case arg_types
    when ["size_t"];                   "c_new_sizet"
    when ["size_t","size_t"];          "c_new_sizet_x2"
    end
  when "_set_ranges";                  "c_self_f_set_ranges"
  when "2d_set_ranges";                "c_self_f_2d_set_ranges"
  when "_get";                         "c_DFloat_f_get"
  when "2d_get";                       "c_DFloat_f_2d_get"
  when /(2d)?_get_[xy]?range/;         "c_DFloat_x2_f_get_range"
  when "_increment";                   "c_self_f_DFloat"
  when "_accumulate";                  "c_self_f_DFloat_x2"
  when "2d_increment";                 "c_self_f_DFloat_x2"
  when "2d_accumulate";                "c_self_f_DFloat_x3"
  when /(2d)?_pdf_init/;               "c_bool_f_pdf_init"
  when "_pdf_sample";                  "c_DFloat_f_DFloat"
  when "2d_pdf_sample";                "c_DFloat_x2_f_DFloat_x2"
  else
    case func_type
    when "double"
      case arg_types
      when [tp];                       "c_double_f_void"
      when [tp,"double"];              "c_double_f_double"
      when [tp,"size_t"];              "c_double_f_sizet"
      when [tp,"size_t","size_t"];     "c_double_f_sizet_x2"
      end
    when "double *"
      case arg_types
      when ["struct"];                 "c_DFloat_f_field"
      end
    when "size_t"
      case arg_types
      when [tp];                       "c_sizet_f_void"
      when [tp,"double"];              "c_sizet_f_double"
      when [tp,"size_t"];              "c_sizet_f_sizet"
      when ["struct"];                 "c_sizet_f_field"
      end
    when "int"
      case arg_types
      when [tp];                       "c_void_f_void"
      when [tp,"double"];              "c_void_f_double"
      when [tp,*["double"]*2];         "c_void_f_double_x2"
      when [tp,*["double"]*4];         "c_void_f_double_x4"
      when [tp,"size_t"];              "c_void_f_sizet"
      when [tp,tp];                    "c_bool_f_other"
      end
    when "void"
      case arg_types
      when [tp];                       "c_void_f_void"
      when [tp,*["size_t *"]*2];       "c_sizet_x2_f_void"
      end
    end
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  ErbPP.new(self,"cast_1d_contiguous",call_init:"")

  name = "Histogram"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_histogram.h gsl/gsl_histogram2d.h]
  set lib_name: name.downcase

  [["Histogram",     "histogram",       hist_list],
   ["HistogramPdf",  "histogram_pdf",   hist_pdf_list],
   ["Histogram2D",   "histogram2d",     hist2d_list],
   ["Histogram2DPdf","histogram2d_pdf", hist2d_pdf_list],
  ].each do |name,base,list|
    def_class('class') do
      set name: base
      set class_name: name
      set class_var: "c"+name
      set full_class_name: "Numo::GSL::"+name
      set struct: "gsl_"+base

      undef_alloc_func
      list.each do |h|
        if t = find_template(h, "gsl_#{base} *")
          m = h[:name] || h[:func_name].sub(/^gsl_#{base}_/,"")
          def_method(m, t, **h)
        else
          $stderr.puts "skip "+h[:func_name]
        end
      end
    end
  end
end.run
