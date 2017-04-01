require_relative "../gen/erbpp_gsl"

class DefSpMatrix < DefGslClass
  def lookup(h)
    case h
    when FM(name:/_free$/);                     false
    when FM(name:/_alloc$/);                    false
    when FM(name:/_alloc_nzmax$/);              "spmatrix_new"

    when FM(name:/_sp2d$/);                     "spmatrix_sp2d"
    when FM(name:/_d2sp$/);                     "spmatrix_d2sp"

    when FM(tp,tp,tp,name:/_add$/);             "spmatrix_add"
    when FM(tp,*[szt]*2,type:"double");         "c_DFloat_f_SZ_x2"
    when FM(tp,*[szt]*2,"double");              "c_self_f_SZ_x2_DFloat"
    when FM(szt,tp); h[:postpose]=true;         "c_self_f_sizet"
    when FM(tp,"double");                       "c_self_f_double"
    when FM(tp,*["double *"]*2);                "c_double_x2_f_void"
    when FM(tp,type:tp);                        "c_other_f_void"
    when FM(tp,tp,type:"int");                  "c_self_f_other"
    when FM(tp,type:"size_t");                  "c_sizet_f_void"
    when FM(tp,type:"int");                     "c_self_f_void"
    end
  end
end


class DefSpBlas < DefGslModule
  def lookup(h)
    case h
    when FM(name:/_dgemv$/);    "spblas_dgemv"
    when FM(name:/_dgemm$/);    "spblas_dgemm"
    end
  end
end


class DefIterSolve < DefGslClass

  def lookup(h)
    case h
    when FM(name:/_free$/);              false
    when FM(name:/_itersolve_alloc$/);   "itersolve_new"
    when FM(name:/_itersolve_iterate$/); "itersolve_iterate"
    when FM(tp, type:str);               "c_str_f_void"
    when FM(tp, type:dbl);               "c_double_f_void"
    end
  end

  ITERSOLVE_TYPES = ErbppGsl.read_type.select{|s|
    /gsl_splinalg_itersolve_/ =~ s
  }

  def check_func(h)
    if t = lookup(h)
      m = h[:func_name].sub(/^gsl_splinalg_itersolve_/,"")
      DefMethod.new(self, t, name:m, **h)
      if /_alloc$/ =~ h[:func_name]
        t = "itersolve_type_new"
        ITERSOLVE_TYPES.each do |st|
          DefSubclassNew.new(self, t, st, **h)
        end
      end
      return true
    end
    $stderr.puts "skip #{h[:func_name]}"
    false
  end

end
