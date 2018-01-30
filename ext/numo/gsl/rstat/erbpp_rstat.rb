require_relative "../gen/erbpp_gsl"

ErbppGsl.read_func_pattern(
  [/^gsl_rstat_quantile_(\w+)$/,rquantile_list=[]],
  [/^gsl_rstat_(\w+)$/,         rstat_list=[]],
)

class DefRstat < DefGslClass
  def lookup(h)
    case h
    when FM(name:/_free$/);             false
    when FM(dbl, name:/_alloc$/);       "c_new_double"
    when FM("", name:/_alloc$/);        "c_new_void"

    when FM(tp, type:dbl);              "c_double_f_void"
    when FM(tp, type:szt);              "c_sizet_f_void"
    when FM(tp, type:int);              "c_void_f_void"
    when FM(dbl,tp); h[:postpose]=true; "c_self_f_DFloat"
    end
  end
end

DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  name = "Rstat"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_rstat.h"]
  set lib_name: name.downcase
  set ns_var: "mG"

  DefRstat.new(self) do
    name = "Rstat"
    set name: name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_rstat_workspace"

    undef_alloc_func
    rstat_list.each do |h|
      check_func(h)
    end
    def_alias("size", "n")
    def_alias("length", "n")
  end

  DefRstat.new(self) do
    name = "Quantile"
    set name: "rstat_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Rstat::"+name
    set struct: "gsl_rstat_quantile_workspace"
    set ns_var: "cRstat"

    undef_alloc_func
    rquantile_list.each do |h|
      check_func(h)
    end
  end
end.run
