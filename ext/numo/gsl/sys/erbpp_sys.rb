require_relative "../gen/erbpp_gsl"

func_list  = ErbppGsl.read_func
const_list = ErbppGsl.read_const
enum_list  = ErbppGsl.read_enum

class DefSys < DefGslModule
  def lookup(h)
    case h
    when FM(dbl, type:int);             "m_Int_f_DFloat"
    when FM(*[dbl]*3, type:int);        "m_Int_f_DFloat_x3" # gsl_fcmp
    when FM(dbl, type:dbl);             "m_DFloat_f_DFloat"
    when FM(*[dbl]*2, type:dbl);        "m_DFloat_f_DFloat_x2"
    when FM(*[dbl]*3, type:dbl);        "m_DFloat_f_DFloat_x3"
    when FM(int, type:dbl);             "m_DFloat_f_Int"
    when FM(dbl,int, type:dbl);         "m_DFloat_f_DFloat_Int"
    when FM(dbl,uint, type:dbl);        "m_DFloat_f_DFloat_UInt"
    when FM(dbl,intp, type:dbl);        "m_DFloat_Int_f_DFloat"  # gsl_frexp
    end
  end

  def to_method_name(s)
    s.sub(/^gsl_/,"")
  end
end

DefLib.new do
  set line_number: true
  set erb_dir: %w[tmpl ../gen/tmpl]
  set erb_suffix: ".c"

  set file_name: "gsl_sys.c"
  set include_files: %w[gsl/gsl_sys.h gsl/gsl_pow_int.h gsl/gsl_math.h gsl/gsl_mode.h]
  set lib_name: "sys"
  set ns_var: "mGSL"

  DefSys.new(self) do
    set name: "sys"
    set module_name: "GSL"
    set module_var: "mGSL"
    set full_module_name: "Numo::GSL"

    func_list.each do |h|
      check_func(h)
    end

    const_list.each do |a|
      m = a[0].sub(/^GSL_/,"")
      v = "DBL2NUM(#{a[0]})"
      def_const(m, v, desc:a[1]||"")
    end

    enum_list.each do |a|
      m = a[0].sub(/^GSL_/,"")
      v = "INT2FIX(#{a[1]})"
      def_const(m, v, desc:a[2]||"")
    end
  end

end.run
