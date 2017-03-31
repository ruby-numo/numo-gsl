require_relative "parse_sf"
require "erbpp/line_number"


ErbppGsl.read_func_pattern(
 [/gsl_sf_mathieu_(\w+_array|alloc|free)$/,  mathieu_list=[]],
 [/gsl_sf_(\w+)$/,                           sf_list=[]],
)

DefLib.new do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Sf"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_sf.h"]
  set lib_name: name.downcase

  DefSf.new(self) do
    name = "Sf"
    set name: name.downcase
    set module_name: name
    set module_var: "m"+name
    set full_module_name: "Numo::GSL::"+name

    sf_list.each do |h|
      check_func(h)
    end
  end

  def_class do
    name = "Mathieu"
    set ns_var: "mSf"
    set name: "sf_"+name.downcase
    set class_name: name
    set class_var: "c"+name
    set full_class_name: "Numo::GSL::Sf::"+name
    set struct: "gsl_sf_mathieu_workspace"

    undef_alloc_func
    c = MathieuArray
    mathieu_list.each do |h|
      if t = c.lookup(h)
        c.new(self, t, **h)
      else
        $stderr.puts "skip "+h[:func_name] if /_e$/ !~ h[:func_name]
      end
    end
  end
end.run
