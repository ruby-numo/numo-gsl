require_relative "parse_ran"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

ErbppGsl.read_func_pattern(
  [ /^gsl_ran_discrete_(\w+)$/,   disc_list=[]],
  [ /^gsl_ran_(\w+)_pdf$/,        ran_list=[]],
)

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Ran"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_randist.h"]
  set lib_name: "ran"

  DefRan.new(self) do
    set name: "ran"
    set module_name: "Ran"
    set module_var: "mRan"
    set full_module_name: "Numo::GSL::Ran"

    ran_list.each do |h|
      check_func(h)
    end
  end

  def_class do
    set ns_var: "mRan"
    set name: "ran_discrete"
    set class_name: "Discrete"
    set class_var: "cDiscrete"
    set full_class_name: "Numo::GSL::Ran::Discrete"
    set struct: "gsl_ran_discrete_t"

    c = RanDiscretePdf
    disc_list.each do |h|
      if t = c.lookup(h)
        m = h[:func_name].sub(/gsl_ran_discrete_/,"")
        c.new(self, t, name:m, **h)
      else
        $stderr.puts "skip "+h[:func_name]
      end
    end
  end

end.run
