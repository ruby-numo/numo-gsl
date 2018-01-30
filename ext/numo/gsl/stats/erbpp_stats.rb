require_relative "../gen/erbpp_gsl"
require_relative "parse_stats"

ErbppGsl.read_func_pattern(
 [/^gsl_stats_(\w+)$/, stats_list=[]]
)

DefLib.new(nil) do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Stats"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_statistics.h"]
  set lib_name: "stats"

  DefStats.new(self) do
    set name: "stats"
    set module_name: "Stats"
    set module_var: "mStats"
    set full_module_name: "Numo::GSL::Stats"

    stats_list.each do |h|
      check_func(h)
    end
  end

end.run
