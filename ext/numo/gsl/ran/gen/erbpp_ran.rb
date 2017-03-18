require_relative "parse_ran"
require "erbpp/line_number"

gsl_list = eval(open("gen/func_def.rb").read)
ran_list = []
mathieu_list = []
gsl_list.each do |h|
  case h[:func_name]
  when /^gsl_ran_(\w+)_pdf$/
    ran_list << h
  else
  #  $stderr.puts "skip "+ h[:func_name]
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Ran"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_randist.h"]
  set lib_name: "ran"

  DefRan.new(self,'module') do
    set name: "ran"
    set module_name: "Ran"
    set module_var: "mRan"
    set full_module_name: "Numo::GSL::Ran"

    ran_list.each do |h|
      check_func(h)
    end
  end

end.run
