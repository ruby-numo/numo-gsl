require_relative "func_parser"

module ErbppGsl

  module_function

  def FM(*args,**opts)
    FuncMatch.new(*args,**opts)
  end

  def dbl;   "double"   end
  def dblp;  "double *" end
  def str;   "char *"   end
  def szt;   "size_t"   end
  def sztp;  "size_t *" end
  def int;   "int"      end
  def long;  "long"     end
  def uint;  "unsigned int" end
  def ulong; /^unsigned long/ end
  def void;  "void"     end
  def tp; get(:struct)+" *" end

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

class DefSubclassNew < DefMethod
  def initialize(parent,tmpl,var,subtp=nil,**h)
    super(parent, tmpl, name:"new", **h)
    if !subtp
      subtp = var.sub(/gsl_#{parent.name}_/,"")
    end
    set subtype_var: var
    set subtype_name: subtp
    set subtype_class: subtp.split('_').map{|x| x.capitalize}.join("")
    set c_superclass_new: "#{parent.name}_s_new"
  end

  def c_func(narg=nil)
    super(narg)
    "#{@parent.name}_#{get(:subtype_name)}_s_new"
  end

  def init_def
    if n_arg != :nodef
      "{ VALUE c#{subtype_class} = rb_define_class_under(#{_mod_var}, \"#{subtype_class}\", #{_mod_var});
      rb_define_singleton_method(c#{subtype_class}, \"new\", #{c_func}, #{n_arg}); }"
    end
  end
end
