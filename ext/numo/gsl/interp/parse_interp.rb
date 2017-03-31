require_relative "../gen/erbpp_gsl"

class DefInterp < DefClass
  include ErbppGsl

  types = ErbppGsl.read_type
  INTERP_TYPES = types.select{|s| /gsl_interp_/ =~ s}
  INTERP2D_TYPES = types.select{|s| /gsl_interp2d_/ =~ s}

  def lookup(h)
    dblbk = [dbl, /\[\]$/]
    case h
    when FM(name:/_free$/);                     false
    when FM(tp,*[dblbk]*3,szt,szt,name:/_init$/); "interp2d_new"
    when FM(tp,*[dblbk]*2,szt,name:/_init$/);     "interp_new"
    when FM(name:"gsl_interp_bsearch");         "interp_bsearch"
    when FM(tp, type:str);                      "c_str_f_void"
    when FM(tp, type:uint);                     "c_uint_f_void"
    when FM(tp, dbl,      /accel/,   type:dbl); "spline_eval"
    when FM(tp,*[dbl]*2,  /accel/,   type:dbl); "spline_integ"
    when FM(tp,*[dbl]*2,*[/accel/]*2,type:dbl); "spline2d_eval"

    when FM(name:"gsl_interp_accel_alloc");     "c_new_void"
    when FM(tp);                                "c_self_f_void"
    end
  end

  def check_func(h)
    if t = lookup(h)
      m = h[:func_name].sub(/^gsl_[^_]+_(accel_)?/,"")
      DefMethod.new(self, t, name:m, **h)
      def_type_new(h)
      return true
    end
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

  def def_type_new(h)
    case h[:func_name]
    when "gsl_interp_init"
      t = "interp_type_new"
      INTERP_TYPES.each do |v|
        st = v.sub(/^gsl_interp_/,"")
        DefSubclassNew.new(self, t, v, st, **h)
      end
    when "gsl_spline_init"
      t = "interp_type_new"
      INTERP_TYPES.each do |v|
        st = v.sub(/^gsl_interp_/,"")
        DefSubclassNew.new(self, t, v, st, **h)
      end
    when "gsl_interp2d_init"
      t = "interp2d_type_new"
      INTERP2D_TYPES.each do |v|
        st = v.sub(/^gsl_interp2d_/,"")
        DefSubclassNew.new(self, t, v, st, **h)
      end
    when "gsl_spline2d_init"
      t = "interp2d_type_new"
      INTERP2D_TYPES.each do |v|
        st = v.sub(/^gsl_interp2d_/,"")
        DefSubclassNew.new(self, t, v, st, **h)
      end
    end
  end
end
class Interp < DefMethod
  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_(accel_)?/,"")
    super(parent,tmpl,name:m,**h)
  end
end

class InterpInit < DefMethod
  def initialize(parent,tmpl,**h)
    super(parent,tmpl,name:"new",**h)
    t = get(:interp_type).sub(/gsl_interp(2d)?_/,"")
    set interp_type_name: t
    set c_interp_new: "#{parent.name}_s_new"
    set type_class: t.split('_').map{|x| x.capitalize}.join("")
  end

  def c_func(narg=nil)
    super(narg)
    "#{@parent.name}_#{get(:interp_type_name)}_s_new"
  end

  def init_def
    "{ VALUE c#{type_class} = rb_define_class_under(#{_mod_var}, \"#{type_class}\", #{_mod_var});
      rb_define_singleton_method(c#{type_class}, \"new\", #{c_func}, #{n_arg}); }"
  end
end
