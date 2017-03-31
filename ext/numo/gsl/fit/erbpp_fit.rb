require_relative "parse_fit"
require_relative "../gen/erbpp_gsl"
require "erbpp/line_number"

fit_list = ErbppGsl.read_func

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Fit"
  set file_name: "gsl_#{name}.c"
  set include_files: %w[gsl/gsl_fit.h]
  set lib_name: name.downcase

  ErbPP.new(self,"check_1d")

  DefFit.new(self) do
    set name: name.downcase
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    fit_list.each do |h|
      check_func(h)
    end

  end
end.run
