require_relative "parse_stats"
require "erbpp/line_number"

gsl_list = eval(open("gen/func_def.rb").read)
stats_list = []

gsl_list.each do |h|
  case h[:func_name]
  when /^gsl_stats_(\w+)$/
    stats_list << h
  else
    $stderr.puts "skip "+ h[:func_name]
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Stats"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_statistics.h"]
  set lib_name: "stats"

  DefStats.new(self,'module') do
    set name: "stats"
    set module_name: "Stats"
    set module_var: "mStats"
    set full_module_name: "Numo::GSL::Stats"

    stats_list.each do |h|
      check_func(h)
    end
  end

end.run
