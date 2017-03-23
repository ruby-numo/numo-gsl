require_relative "../../gen/func_parser"

class DefInterp < DefClass

  INTERP_TYPES = %w[
   gsl_interp_linear
   gsl_interp_polynomial
   gsl_interp_cspline
   gsl_interp_cspline_periodic
   gsl_interp_akima
   gsl_interp_akima_periodic
   gsl_interp_steffen
  ]
  INTERP2D_TYPES = %w[
   gsl_interp2d_bilinear
   gsl_interp2d_bicubic
  ]

  def FM(*args,**opts)
    FuncMatch.new(*args,**opts)
  end

  def lookup(h,tp)
    case h
    when FM(name:/_free$/);  false
    when FM(tp,*[["double",/\[\]$/]]*3,*["size_t"]*2,name:/_init$/)
                                                          "interp2d_new"
    when FM(name:"gsl_interp_bsearch");                   "interp_bsearch"
    when FM(tp, type:"char *");                           "c_str_f_void"
    when FM(tp, type:"unsigned int");                     "c_uint_f_void"
    when FM(tp, *[["double",/\[\]$/]]*2, "size_t", name:/_init$/)
                                                          "interp_new"
    when FM(tp, "double",      /accel/,   type:"double"); "spline_eval"
    when FM(tp,*["double"]*2,  /accel/,   type:"double"); "spline_integ"
    when FM(tp,*["double"]*2,*[/accel/]*2,type:"double"); "spline2d_eval"

    when FM(name:"gsl_interp_accel_alloc");               "c_new_void"
    when FM(tp);                                          "c_self_f_void"
    end
  end

  def check_func(h)
    if t = lookup(h, get(:struct)+" *")
      Interp.new(self, t, **h)
      def_type_new(h)
      return true
    end
    #$stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    false
  end

  def def_type_new(h)
    case h[:func_name]
    when "gsl_interp_init"
      t = "interp_type_new"
      INTERP_TYPES.each do |tp|
        InterpInit.new(self, t, interp_type:tp, **h)
      end
    when "gsl_spline_init"
      t = "interp_type_new"
      INTERP_TYPES.each do |tp|
        InterpInit.new(self, t, interp_type:tp, **h)
      end
    when "gsl_interp2d_init"
      t = "interp2d_type_new"
      INTERP2D_TYPES.each do |tp|
        InterpInit.new(self, t, interp_type:tp, **h)
      end
    when "gsl_spline2d_init"
      t = "interp2d_type_new"
      INTERP2D_TYPES.each do |tp|
        InterpInit.new(self, t, interp_type:tp, **h)
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

  def define
    super unless /_init$/ =~ get(:func_name)
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

  def define
    "{ VALUE c#{type_class} = rb_define_class_under(#{_mod_var}, \"#{type_class}\", #{_mod_var});
      rb_define_singleton_method(c#{type_class}, \"new\", #{c_func}, #{n_arg}); }"
  end
end
