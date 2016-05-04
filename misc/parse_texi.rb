module ParseTexi

  module_function

  def parse(f)
    result = []
    f.each_line do |line|
      line.chomp!
      if /^(@\w+)\s+(\S.*)$/ =~ line
        # line="@deftypefun double gsl_func(..."
        s = [$1,$2]
        if s[0] == "@end"
          # line="@end deftypefun"
          re_tag = /^@#{s[1].strip}$/
          a = []
          line_no = nil
          (result.size-1).downto(0) do |i|
            if re_tag =~ result[i][0]
              line_no = i+1
              break
            end
          end
          if line_no
            a = result.slice!(line_no..-1)
            result.last[2] = a
          end
        else
          result << s
        end
      else
        result << [line]
      end
    end
    result
  end

  def decode(s)
    s = s.dup
    # matches nested braces
    while s.gsub!(/@\w+(?<paren>\{(?:[^{}]|\g<paren>)*\})/){|x| $1[1..-2]}
    end
    s
  end

end

if __FILE__ == $0
  require 'pp'

  Dir.glob('../../gsl-2.1/doc/*.texi') do |fn|
    puts "#--- #{File.basename(fn)} ---"
    a = ParseTexi.parse(open(fn))
    pp a
    #deffun(a)
  end
end
