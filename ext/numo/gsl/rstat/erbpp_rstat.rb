require_relative "gen/erbpp2"

gsl_methods = eval(open("gen/func_def.rb").read)
rstat_methods = gsl_methods.select do |h|
  h[:func_name] =~ /^gsl_rstat_([a-z]+)$/ &&
  h[:func_type] == "double" &&
  h[:args] == [["gsl_rstat_workspace *", "w"]]
end

DefLib.new(nil,'lib') do
  set erb_dir: "gen/tmpl"
  set erb_suffix: ".c"

  name = "Rstat"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_rstat.h"]
  set lib_name: name.downcase

  def_class('class') do
    set name: name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::"+name
    set struct: "gsl_rstat_workspace"

    undef_alloc_func
    def_method("new", 'new_void', name:"new", singleton:true)
    def_method("reset", 'void_f_void', name:"reset")
    def_method("n", 'sizet_f_void', name:"n")
    def_alias("size", "n")
    def_alias("length", "n")
    def_method("add", 'self_f_DFloat')
    rstat_methods.each do |h|
      m = h[:func_name].sub(/^gsl_rstat_/,"")
      def_method(m, 'double_f_void', desc:h[:desc])
    end
  end

  name = "Quantile"
  def_class('class') do
    set name: "rstat_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Rstat::"+name
    set struct: "gsl_rstat_quantile_workspace"

    undef_alloc_func
    def_method("new", 'new_double', singleton:true)
    #def_method("reset", 'void_f_void')
    def_method("add", 'self_f_DFloat')
    def_method("get", 'double_f_void')
  end
end.run
