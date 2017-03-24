require_relative "../gen/func_parser"

class DefSpMatrix < DefClass

  SPMATRIX_TYPES = %w[
Triplet
Ccs
  ]

  def FM(*args,**opts)
    FuncMatch.new(*args,**opts)
  end

  def lookup(h,tp)
    tp = tp + " *"
    sz = "size_t"
    case h
    when FM(name:/_free$/);                     false
    when FM(name:/_alloc$/);                    false
    when FM(name:/_alloc_nzmax$/);              "spmatrix_new"

    when FM(name:/_sp2d$/);                     "spmatrix_sp2d"
    when FM(name:/_d2sp$/);                     "spmatrix_d2sp"

    when FM(tp,tp,tp,name:/_add$/);             "spmatrix_add"
    when FM(tp,*[sz]*2,type:"double");          "c_DFloat_f_SZ_x2"
    when FM(tp,*[sz]*2,"double");               "c_self_f_SZ_x2_DFloat"
    when FM(sz,tp); h[:postpose]=true;          "c_self_f_sizet"
    when FM(tp,"double");                       "c_self_f_double"
    when FM(tp,*["double *"]*2);                "c_double_x2_f_void"
    when FM(tp,type:tp);                        "c_other_f_void"
    when FM(tp,tp,type:"int");                  "c_self_f_other"
    when FM(tp,type:"size_t");                  "c_sizet_f_void"
    when FM(tp,type:"int");                     "c_self_f_void"
    end
  end

  def check_func(h)
    if t = lookup(h, get(:struct))
      SpMatrix.new(self, t, **h)
      #def_type_new(h)
      return true
    end
    #$stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

  def def_type_new(h)
    case h[:func_name]
    when "gsl_spmatrix_alloc"
      t = "spmatrix_type_new"
      SPMATRIX_TYPES.each do |tp|
        SpMatrixAlloc.new(self, t, subtype:tp, **h)
      end
    end
  end
end

class SpMatrix < DefMethod
  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_(accel_)?/,"")
    super(parent,tmpl,name:m,**h)
  end

  def define
    super unless "gsl_spmatrix_alloc" == get(:func_name)
  end
end

# ----------------------------------------------------------

class DefSpBlas < DefModule

  def FM(*args,**opts)
    FuncMatch.new(*args,**opts)
  end

  def lookup(h,tp)
    tp = tp + " *"
    case h
    when FM(name:/_dgemv$/);    "spblas_dgemv"
    when FM(name:/_dgemm$/);    "spblas_dgemm"
    end
  end

  def check_func(h)
    if t = lookup(h, get(:struct))
      SpBlas.new(self, t, **h)
      return true
    end
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

end

class SpBlas < DefMethod
  def initialize(parent,tmpl,**h)
    @preproc_code = ""
    m = h[:func_name].sub(/^gsl_[^_]+_/,"")
    super(parent,tmpl,name:m,**h)
  end
end
