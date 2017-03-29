module ErbppGsl

  module_function

  def read_eval(file)
    fn = file % `gsl-config --version`.chomp
    fn = file % "def" unless File.exist?(fn)
    File.exist?(fn) ? eval(open(fn).read) : []
  end

  def read_func
    read_eval("func_%s.rb").each do |h|
      h[:desc].gsub!(/\/\*/,"//")
      h[:desc].gsub!(/\*\//,"")
    end
  end

  def read_const
    read_eval("const_%s.rb")
  end

  def read_enum
    read_eval("enum_%s.rb")
  end

  def read_func_pattern(*a)
    read_func.each do |h|
      no_match = true
      a.each do |re,list|
        if re === h[:func_name]
          list << h
          no_match = false
          break
        end
      end
      if no_match
        $stderr.puts "skip "+h[:func_name]
      end
    end
  end

end
