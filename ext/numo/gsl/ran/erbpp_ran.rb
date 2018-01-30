require_relative "../gen/erbpp_gsl"
require_relative "parse_ran"

ErbppGsl.read_func_pattern(
  [ /^gsl_ran_discrete_(\w+)$/,   disc_list=[]],
  [ /^gsl_ran_(\w+)_pdf$/,        ran_list=[]],
)

DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Ran"
  base = name.downcase
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_randist.h"]
  set lib_name: "ran"

  def_module do
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name
  end

  DefDiscrete.new(self) do
    name = "Discrete"
    base = name.downcase
    set ns_var: "mRan"
    set name: "ran_"+base
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Ran::"+name
    set struct: "gsl_ran_discrete_t"

    disc_list.each do |h|
      check_func(h)
    end
  end

end.run
