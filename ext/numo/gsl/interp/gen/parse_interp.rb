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

  def check_func(h)
    [
     Interp,
    ].each do |c|
      if t = c.lookup(h, get(:struct)+" *")
        c.new(self, t, **h)
        def_type_new(h)
        return true
      end
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

def FM(*args,**opts)
  FuncMatch.new(*args,**opts)
end

class Interp < DefMethod

  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_/,"")
    super(parent,tmpl,name:m,**h)
  end

  def self.lookup(h,tp)
    case h
    when FM(name:/_free$/);               false
    when FM(tp,*[["double",/\[\]$/]]*3,*["size_t"]*2,name:/_init$/)
                                                      "interp2d_new"
    when FM(name:"gsl_interp_bsearch");               "interp_bsearch"
    when FM(tp, type:"char *");                       "c_str_f_void"
    when FM(tp, type:"unsigned int");                 "c_uint_f_void"
    when FM(tp, *[["double",/\[\]$/]]*2, "size_t", name:/_init$/)
                                                      "interp_new"
    when FM(tp, "double",    /accel/,type:"double");       "spline_eval"
    when FM(tp,*["double"]*2,/accel/,type:"double");       "spline_integ"
    when FM(tp,*["double"]*2,*[/accel/]*2,type:"double");  "spline2d_eval"

    when FM(name:"gsl_interp_accel_alloc");  "c_new_void"
    when FM(tp);                             "c_self_f_void"
    end
  end

  def define
    super unless /_init$/ =~ get(:func_name)
  end
end

=begin
class Interp2D < Interp

  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_/,"")
    super(parent,tmpl,name:m,**h)
  end

  def self.lookup(h,tp)
    case h
    else; Interp.lookup(h,tp)
    end
  end

end
=end

class InterpInit < DefMethod

  def initialize(parent,tmpl,**h)
    super(parent,tmpl,name:"new",**h)
    t = get(:interp_type).sub("gsl_interp_","")
    set interp_type_name: t
    set c_interp_new: "#{parent.name}_s_new"
    set type_class: t.split('_').map{|x| x.capitalize}.join("")
  end

  def c_func
    "#{@parent.name}_#{get(:interp_type_name)}_s_new"
  end

  def define
    "{ VALUE c#{type_class} = rb_define_class_under(#{_mod_var}, \"#{type_class}\", #{_mod_var});
      rb_define_singleton_method(c#{type_class}, \"new\", #{c_func}, #{n_arg}); }"
  end

end


=begin
  def self.lookup(h,tp)
    if /This function is now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return nil
    end
    func_type = h[:func_type]
    arg_types = h[:args].map{|a| a[0].sub(/^const /,"")}
    h[:postpose] = false
    #
    case h[:func_name].sub(/gsl_interp/,"")
    when /_(alloc|init|free)$/;          false
    #when "_set_ranges";                  "c_self_f_set_ranges"
    #when "2d_set_ranges";                "c_self_f_2d_set_ranges"
    #when "_get";                         "c_DFloat_f_get"
    #when "2d_get";                       "c_DFloat_f_2d_get"
    #when /(2d)?_get_[xy]?range/;         "c_DFloat_x2_f_get_range"
    #when "_increment";                   "c_self_f_DFloat"
    #when "_accumulate";                  "c_self_f_DFloat_x2"
    #when "2d_increment";                 "c_self_f_DFloat_x2"
    #when "2d_accumulate";                "c_self_f_DFloat_x3"
    #when /(2d)?_pdf_init/;               "c_bool_f_pdf_init"
    #when "_pdf_sample";                  "c_DFloat_f_DFloat"
    #when "2d_pdf_sample";                "c_DFloat_x2_f_DFloat_x2"
    else
      case func_type
      when "double"
        case arg_types
        when [tp];                       "c_double_f_void"
        when [tp,"double"];              "c_double_f_double"
        when [tp,"size_t"];              "c_double_f_sizet"
        when [tp,"size_t","size_t"];     "c_double_f_sizet_x2"
        end
      when "double *"
        case arg_types
        when ["struct"];                 "c_DFloat_f_field"
        end
      when "size_t"
        case arg_types
        when [tp];                       "c_sizet_f_void"
        when [tp,"double"];              "c_sizet_f_double"
        when [tp,"size_t"];              "c_sizet_f_sizet"
        when ["struct"];                 "c_sizet_f_field"
        end
      when "int"
        case arg_types
        when [tp];                       "c_void_f_void"
        when [tp,"double"];              "c_void_f_double"
        when [tp,*["double"]*2];         "c_void_f_double_x2"
        when [tp,*["double"]*4];         "c_void_f_double_x4"
        when [tp,"size_t"];              "c_void_f_sizet"
        when [tp,tp];                    "c_bool_f_other"
        end
      when "void"
        case arg_types
        when [tp];                       "c_void_f_void"
        when [tp,*["size_t *"]*2];       "c_sizet_x2_f_void"
        end
      end
    end
  end
=end
