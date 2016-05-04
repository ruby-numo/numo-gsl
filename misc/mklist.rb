eval(ARGF.read).map{|x| x[:func_name]}.sort.each{|s| puts s}
