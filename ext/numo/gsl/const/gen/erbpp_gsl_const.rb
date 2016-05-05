require_relative "erbpp_gsl"

class DefineModule < ErbPP

  def initialize(erb_path)
    super(nil, erb_path)
    @mod_var = "mM"
  end

  define_attrs %w[
    m_prefix
    mod_var
    class_name
    desc
  ]

  def load_const_def(file)
    str = open(file,"r").read
    ary = eval(str)
    ary.each do |name,desc|
      desc ||= ""
      value = "DBL2NUM(#{name})"
      name.sub!(/^GSL_CONST_/,"")
      Const.new(self,name,value,desc)
    end
  end
end
