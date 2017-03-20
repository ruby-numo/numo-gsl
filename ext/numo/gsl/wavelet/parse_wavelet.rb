require_relative "../gen/func_parser"

class DefWavelet < DefClass

  WAVELET_TYPES = %w[
   gsl_wavelet_daubechies
   gsl_wavelet_daubechies_centered
   gsl_wavelet_haar
   gsl_wavelet_haar_centered
   gsl_wavelet_bspline
   gsl_wavelet_bspline_centered
  ]

  def FM(*args,**opts)
    FuncMatch.new(*args,**opts)
  end

  def lookup(h,tp)
    case h
    when FM(name:/_free$/);                               false
    when FM(name:"gsl_wavelet_workspace_alloc");          "c_new_sizet"
    when FM(/_type /, "size_t", name:/_alloc$/);          "wavelet_new"
    when FM(tp, type:"char *");                           "c_str_f_void"
    when FM(tp, type:"unsigned int");                     "c_uint_f_void"

    when FM("gsl_wavelet *","double *","size_t","size_t",
            "gsl_wavelet_direction","gsl_wavelet_workspace *");
                                                          "wavelet_transform"
    when FM("gsl_wavelet *","double *","size_t","size_t",
            "gsl_wavelet_workspace *");
                                                          "wavelet_transform2"

    when FM("gsl_wavelet *","double *",*["size_t"]*3,
            "gsl_wavelet_direction","gsl_wavelet_workspace *");
                                                          "wavelet2d_transform"
    when FM("gsl_wavelet *","double *",*["size_t"]*3,
            "gsl_wavelet_workspace *");
                                                          "wavelet_transform2"

    when FM(tp);                                           "c_self_f_void"
    end
  end

  def check_func(h)
    if t = lookup(h, get(:struct)+" *")
      Wavelet.new(self, t, **h)
      def_type_new(h)
      return true
    end
    #$stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

  def def_type_new(h)
    case h[:func_name]
    when "gsl_wavelet_alloc"
      t = "wavelet_type_new"
      WAVELET_TYPES.each do |tp|
        WaveletAlloc.new(self, t, subtype:tp, **h)
      end
    end
  end
end

class Wavelet < DefMethod
  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_(accel_)?/,"")
    super(parent,tmpl,name:m,**h)
  end

  def define
    super unless "gsl_wavelet_alloc" == get(:func_name)
  end
end

class WaveletAlloc < DefMethod
  def initialize(parent,tmpl,**h)
    super(parent, tmpl, name:"new", **h)
    t = get(:subtype).sub(/gsl_[^_]+_/,"")
    set subtype_name: t
    set subtype_class: t.split('_').map{|x| x.capitalize}.join("")
    set c_superclass_new: "#{parent.name}_s_new"
  end

  def c_func
    "#{@parent.name}_#{get(:subtype_name)}_s_new"
  end

  def define
    "{ VALUE c#{subtype_class} = rb_define_class_under(#{_mod_var}, \"#{subtype_class}\", #{_mod_var});
      rb_define_singleton_method(c#{subtype_class}, \"new\", #{c_func}, #{n_arg}); }"
  end
end
