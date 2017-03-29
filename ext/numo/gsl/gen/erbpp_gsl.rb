module ErbppGsl

  module_function

  def read_eval(file)
    fn = file % `gsl-config --version`.chomp
    fn = file % "def" unless File.exist?(fn)
    File.exist?(fn) ? eval(open(fn).read) : []
  end

  def read_func
    read_eval("func_%s.rb")
  end

  def read_const
    read_eval("const_%s.rb")
  end

  def read_enum
    read_eval("enum_%s.rb")
  end

end
