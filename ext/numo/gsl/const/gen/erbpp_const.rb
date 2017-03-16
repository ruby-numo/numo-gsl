require_relative "../../gen/erbpp2"
require "erbpp/line_number"

const_list = eval(open("gen/const_def.rb").read)

DefLib.new(nil,'lib') do
  set erb_dir: %w[gen/tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  set file_name: "gsl_const.c"
  set include_files: %w[gsl/gsl_const.h]
  set lib_name: "const"
  set ns_var: "mGSL"

  def_module('module') do
    set name: "const"
    set module_name: "Const"
    set module_var: "mConst"
    set full_module_name: "Numo::GSL::Const"

    const_list.each do |a|
      m = a[0].sub(/^GSL_CONST_/,"")
      v = "DBL2NUM(#{a[0]})"
      def_const(m, v, desc:a[1]||"")
    end
  end

end.run
