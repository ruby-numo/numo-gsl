module ErbppGsl

  module_function

  def read_eval(prefix)
    fmt = prefix + "_%s.rb"
    fn = fmt % `gsl-config --version`.chomp
    if !File.exist?(fn)
      fn = fmt % "def"
    end
    File.exist?(fn) ? eval(open(fn).read) : []
  end

  def read_func(prefix="func")
    read_eval(prefix).each do |h|
      h[:desc].gsub!(/\/\*/,"//")
      h[:desc].gsub!(/\*\//,"")
    end
  end

  def read_const
    read_eval("const")
  end

  def read_enum
    read_eval("enum")
  end

  def read_type
    read_eval("type")
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
