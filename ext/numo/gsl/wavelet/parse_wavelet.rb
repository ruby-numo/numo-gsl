require_relative "../gen/erbpp_gsl"

class DefWavelet < DefGslClass

  WAVELET_TYPES = ErbppGsl.read_type.select{|s| /gsl_wavelet_/ =~ s}

  def lookup(h)
    t = get(:struct)
    ws = t + "_workspace *"
    dr = t + "_direction"
    case h
    when FM(name:/_free$/);                     false
    when FM(name:"gsl_wavelet_workspace_alloc"); "c_new_sizet"
    when FM(/_type /, szt, name:/_alloc$/);     "wavelet_new"
    when FM(tp, type:str);                      "c_str_f_void"
    when FM(tp, type:uint);                     "c_uint_f_void"

    when FM(tp,dblp,szt,szt,dr,ws);             "wavelet_transform"
    when FM(tp,dblp,szt,szt,ws);                "wavelet_transform2"
    when FM(tp,dblp,*[szt]*3,dr,ws);            "wavelet2d_transform"
    when FM(tp,dblp,*[szt]*3,ws);               "wavelet_transform2"

    when FM(tp);                                "c_self_f_void"
    end
  end

  def check_func(h)
    if t = lookup(h)
      m = h[:func_name].sub(/^gsl_[^_]+_/,"")
      DefMethod.new(self, t, name:m, **h)
      def_type_new(h)
      return true
    end
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

  def def_type_new(h)
    case h[:func_name]
    when "gsl_wavelet_alloc"
      t = "wavelet_type_new"
      WAVELET_TYPES.each do |st|
        DefSubclassNew.new(self, t, st, **h)
      end
    end
  end
end
