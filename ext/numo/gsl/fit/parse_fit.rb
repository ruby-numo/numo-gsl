require_relative "../gen/func_parser"

class DefFit < DefModule

  def lookup(h)
    h[:func_name].sub(/^gsl_/,"")
  end

  def check_func(h)
    if t = lookup(h)
      if File.exist?("tmpl/#{t}.c")
        Fit.new(self, t, **h)
        return true
      end
    end
    #$stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    $stderr.puts "skip #{h[:func_name]}"
    false
  end
end

class Fit < DefMethod
  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_/,"")
    super(parent,tmpl,name:m,singleton:true,n_arg:0,**h)
  end

  def init_def
    if /_est$/ =~ func_name
      super
    else
      vars = []
      found = false
      get(:args).each do |a|
        vars << a[1] if found
        found = true if a[1] == "n"
      end
      items = vars.map{|v| "\"#{v}\""}.join(",")
      cls = (func_name.sub("gsl_fit_","")+"_result").split(/_/).
        map{|x| x.capitalize}.join("")
      super+"
    c#{cls} = rb_struct_define_under(#{_mod_var},\"#{cls}\",#{items},NULL);"
    end
  end
end
