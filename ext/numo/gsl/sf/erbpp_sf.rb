require_relative "parse_sf"
require "erbpp/line_number"

def read_eval(file)
  fn = file % `gsl-config --version`.chomp
  fn = file % "def" unless File.exist?(fn)
  File.exist?(fn) ? eval(open(fn).read) : []
end

def read_func
  read_eval("func_%s.rb")
end

gsl_list = read_func

sf_list = []
mathieu_list = []

gsl_list.each do |h|
  if h[:args].any?{|a| a[0] == "gsl_sf_mathieu_workspace *"} ||
      h[:func_type] == "gsl_sf_mathieu_workspace *"
    mathieu_list << h
  else
    case h[:func_name]
    when /^gsl_sf_(\w+)$/
      sf_list << h
    else
      $stderr.puts "skip "+ h[:func_name]
    end
  end
end

DefLib.new(nil,'lib') do
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"
  set ns_var: "mG"

  name = "Sf"
  set file_name: "gsl_#{name}.c"
  set include_files: ["gsl/gsl_sf.h"]
  set lib_name: "sf"

  DefSf.new(self,'module') do
    set name: "sf"
    set module_name: "Sf"
    set module_var: "mSf"
    set full_module_name: "Numo::GSL::Sf"

    sf_list.each do |h|
      check_func(h)
    end
  end

  name = "Mathieu"
  def_class('class') do
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
