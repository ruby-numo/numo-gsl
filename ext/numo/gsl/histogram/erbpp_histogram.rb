require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

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

ErbppGsl.read_func_pattern(
 [/^gsl_histogram2d_pdf_(\w+)$/, hist2d_pdf_list],
 [/^gsl_histogram2d_(\w+)$/,     hist2d_list],
 [/^gsl_histogram_pdf_(\w+)$/,   hist_pdf_list],
 [/^gsl_histogram_(\w+)$/,       hist_list],
)

class DefHistogram < DefGslClass
  def lookup(h)
    case h
    when FM(name:/_free$/);                 false
    when FM(szt, name:/_alloc$/);           "c_new_sizet"
    when FM(szt,szt, name:/_alloc$/);       "c_new_sizet_x2"
    when FM(name:/2d_set_ranges$/);         "c_self_f_2d_set_ranges"
    when FM(name:/_set_ranges$/);           "c_self_f_set_ranges"
    when FM(name:/(2d)?_get_[xy]?range$/);  "c_DFloat_x2_f_get_range"
    when FM(name:/2d_get$/);                "c_DFloat_f_2d_get"
    when FM(name:/_get$/);                  "c_DFloat_f_get"
    when FM(name:/2d_increment$/);          "c_self_f_DFloat_x2"
    when FM(name:/_increment$/);            "c_self_f_DFloat"
    when FM(name:/2d_accumulate$/);         "c_self_f_DFloat_x3"
    when FM(name:/_accumulate$/);           "c_self_f_DFloat_x2"
    when FM(name:/(2d)?_pdf_init$/);        "c_bool_f_pdf_init"
    when FM(name:/2d_pdf_sample$/);         "c_DFloat_x2_f_DFloat_x2"
    when FM(name:/_pdf_sample$/);           "c_DFloat_f_DFloat"
    when FM(tp, type:dbl);                  "c_double_f_void"
    when FM(tp,dbl, type:dbl);              "c_double_f_double"
    when FM(tp,szt, type:dbl);              "c_double_f_sizet"
    when FM(tp,szt,szt, type:dbl);          "c_double_f_sizet_x2"
    when FM("struct", type:dblp);           "c_DFloat_f_field"
    when FM(tp, type:szt);                  "c_sizet_f_void"
    when FM(tp,dbl, type:szt);              "c_sizet_f_double"
    when FM(tp,szt, type:szt);              "c_sizet_f_sizet"
    when FM("struct", type:szt);            "c_sizet_f_field"
    when FM(tp, type:int);                  "c_void_f_void"
    when FM(tp,dbl, type:int);              "c_void_f_double"
    when FM(tp,*[dbl]*2, type:int);         "c_void_f_double_x2"
    when FM(tp,*[dbl]*4, type:int);         "c_void_f_double_x4"
    when FM(tp,szt, type:int);              "c_void_f_sizet"
    when FM(tp,tp, type:int);               "c_bool_f_other"
    when FM(tp, type:void);                 "c_void_f_void"
    when FM(tp,*[sztp]*2, type:void);       "c_sizet_x2_f_void"
    end
  end
end

DefLib.new do
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
    DefHistogram.new(self) do
      set name: base
      set class_name: name
      set class_var: "c"+name
      set full_class_name: "Numo::GSL::"+name
      set struct: "gsl_"+base

      undef_alloc_func
      list.each do |h|
        check_func(h)
      end
    end
  end
end.run
