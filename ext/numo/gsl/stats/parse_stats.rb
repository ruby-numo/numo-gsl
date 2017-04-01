require_relative "../gen/erbpp_gsl"

class DefStats < DefModule
  include ErbppGsl

  def lookup(h)
    dblbk = [dbl,/\[\]$/]
    case h
    when FM(name:"gsl_stats_spearman");         "stats_spearman"
    when FM(name:"gsl_stats_minmax_index");     "stats_minmax_index"
    when FM(name:"gsl_stats_minmax");           "stats_minmax"
    when FM(name:/_(min|max)_index$/);          "stats_1a0p_index"
    when FM(dblbk,szt,szt);                     "stats_1a0p"
    when FM(dblbk,szt,szt,dbl);                 "stats_1a1p"
    when FM(dblbk,szt,szt,dbl,dbl);             "stats_1a2p"
    when FM(dblbk,szt,dblbk,szt,szt);           "stats_2a0p"
    when FM(dblbk,szt,dblbk,szt,szt,dbl);       "stats_2a1p"
    when FM(dblbk,szt,dblbk,szt,szt,dbl,dbl);   "stats_2a2p"
    end
  end

  def check_func(h)
    if t = lookup(h)
      StatsBasic.new(self,t,**h)
    else
      $stderr.puts "skip #{h[:func_name]}"
    end
  end
end


class StatsBasic < DefModuleFunction
  include FuncParser

  PARAM_DESC = {}
  PARAM_NAMES =
    {
     "double" => %w[csphase],
     "int" => [], #%w[n m i j l kmax lmax nmin nmax size order_min order_max],
     "size_t" => [], #%w[lmax],
    }

  def initialize(parent,tmpl,**h)
    m = h[:func_name].sub(/^gsl_stats_/,"")
    super(parent, tmpl, name:m, **h)
    parse_args(h)
    @varg = -1
    set n_arg: -1
    @preproc_code = ""
  end

  def argument_property(type,name)
    case name
    when "return";          {output:true, narray:true, pass: :return}
    when /\[\]/;            {input:true,  narray:true, pass: :array}
    when /^w?stride/,"n";   {}
    else
      if /(.+)\*$/ =~ type; {output:true, narray:true, pass: :return}
      else;                 {input:true,  param:true}
      end
    end
  end
end
