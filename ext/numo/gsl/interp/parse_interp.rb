require_relative "../gen/erbpp_gsl"

class DefInterp < DefGslClass
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
