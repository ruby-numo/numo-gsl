require_relative "parse_pdf"
require "erbpp/line_number"

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Pdf"
  base = name.downcase
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_randist.h"]
  set lib_name: base

  DefPdf.new(self) do
    set name: base
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    ErbppGsl.read_func.each do |h|
      check_func(h)
    end
  end

end.run
