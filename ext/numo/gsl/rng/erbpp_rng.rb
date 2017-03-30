require_relative "parse_rng"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

ErbppGsl.read_func_pattern(
 [/gsl_rng_/, rng_list=[]],
)

ran_list = ErbppGsl.read_func("../ran/func").select{|h|
  /gsl_rng \*/ =~ h[:args][0][0]
}

#$stderr.puts ran_list.inspect

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  cbase = "rng"
  set file_name: "gsl_#{cbase}.c"
  set include_files: %w[gsl/gsl_rng.h gsl/gsl_randist.h]
  set lib_name: cbase

  ErbPP.new(self,"create_new_narray")
  ErbPP.new(self,"cast_1d_contiguous")

  DefRng.new(self) do
    name = "Rng"
    base = "rng"
    set name: base
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_"+base
    set type_struct: "gsl_"+base+"_type"
    set class_types: ErbppGsl.read_type

    undef_alloc_func
    rng_list.each do |h|
      check_func(h)
    end
  end

  DefRan.new(self) do
    name = "Ran"
    base = "ran"
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name
    set struct: "gsl_rng"
    set data_type_var: "rng_data_type"

    ran_list.each do |h|
      check_func(h)
    end
  end

end.run
