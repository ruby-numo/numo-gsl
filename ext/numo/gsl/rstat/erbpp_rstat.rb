require_relative "gen/erbpp2"

ErbPP.set_erb_dir("gen/tmpl")
ErbPP.set_erb_suffix(".erb.c")

rstat_methods = eval(open("gen/func_def.rb").read).
  select do |h| h[:func_name] =~ /^gsl_rstat_([a-z]+)$/ &&
    h[:func_type] == "double" &&
    h[:args] == [["gsl_rstat_workspace *", "w"]]
  end

name="Rstat"

lib = DefLib.new(nil,'lib') do
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
    def_method("new", 's_new0', name:"new", singleton:true)
    def_method("reset", 'f_void_arg0', name:"reset")
    def_method("n", 'f_sizet_arg0', name:"n")
    def_alias("size", "n")
    def_alias("length", "n")
    def_method("add", 'f_add')
    rstat_methods.each do |h|
      m = h[:func_name].sub(/^gsl_rstat_/,"")
      def_method(m, 'f_dbl_arg0', desc:h[:desc])
    end
  end

  name="Quantile"

  def_class('class') do
    set name: "rstat_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Rstat::"+name
    set struct: "gsl_rstat_quantile_workspace"

    undef_alloc_func
    def_method("new", 's_new_dbl', singleton:true)
    #def_method("reset", 'f_void_arg0')
    def_method("add", 'f_add')
    def_method("get", 'f_dbl_arg0')
  end
end

lib.run
