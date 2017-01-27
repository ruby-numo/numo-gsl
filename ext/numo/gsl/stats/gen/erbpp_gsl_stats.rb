require_relative "../../erbpp_gsl"

class DefineStats < DefineModule

  def check_func_def(h)
    if /These functions are now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    if /This function is now deprecated/m =~ h[:desc]
      $stderr.puts "depricated: #{h[:func_name]}"
      return false
    end
    a = [
     StatsBasic
    ]
    a.each do |c|
      if c.lookup(h)
        c.new(self,**h)
        return true
      end
    end
    $stderr.puts "skip #{h[:func_type]} #{h[:func_name]} #{h[:args].inspect}"
    false
  end

end


class StatsBasic < GslFunction

  PARAM_DESC =
    {
    }
  PARAM_NAMES =
    {
     "double" => %w[csphase],
     "int" => [], #%w[n m i j l kmax lmax nmin nmax size order_min order_max],
     "size_t" => [], #%w[lmax],
    }

  def initialize(parent,**h)
    @preproc_code = ""
    h[:meth] = h[:func_name].sub(/^gsl_stats_/,"")
    tmpl = self.class.find_template_from_args(h[:args])
    super(parent,tmpl,**h)
    @varg = -1
    n_arg(-1)
  end

  def argument_property(type,name)
    case name
    when "return"
      {output:true, narray:true, pass: :return}
    when /\[\]/
      {input:true, narray:true, pass: :array}
    when /^w?stride/,"n"
      {}
    else
      if /(.+)\*$/ =~ type
        {output:true, narray:true, pass: :return}
      else
        {input:true, param:true}
      end
    end
  end

  class << self

    ARGTMPL = [
     "stats_1a0p double[] size_t size_t",
     "stats_1a1p double[] size_t size_t double",
     "stats_1a2p double[] size_t size_t double double",
     "stats_2a0p double[] size_t double[] size_t size_t",
     "stats_2a1p double[] size_t double[] size_t size_t double",
     "stats_2a2p double[] size_t double[] size_t size_t double double",
    ].map{|x| b=x.split; a=b.shift; [a,b]}

    def find_template_from_args(args)
      narg = args.size
      ARGTMPL.each do |tmpl,argtype|
        arg_ok = false
        if narg == argtype.size
          narg.times do |i|
            if /^(.*)\[\]$/ =~ argtype[i]
              type = $1
              if /^(.*)\[\]$/ !~ args[i][1]
                arg_ok = false
                break
              end
            else
              type = argtype[i]
              if /^(.*)\[\]$/ =~ args[i][1]
                arg_ok = false
                break
              end
            end
            if /(const )?#{type}/ =~ args[i][0]
              arg_ok = true
            else
              arg_ok = false
              break
            end
          end
        end
        return tmpl if arg_ok
      end
      false
    end

    def lookup(h)
      tmpl = find_template_from_args(h[:args])
      return File.exist?("gen/tmpl/#{tmpl}.c")
    end

  end

end
