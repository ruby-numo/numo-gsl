require 'mkmf'

def find_narray_h
  $LOAD_PATH.each do |x|
    if File.exist? File.join(x,'numo/numo/narray.h')
      $INCFLAGS = "-I#{x}/numo " + $INCFLAGS
      break
    end
  end
end

def find_libnarray_a
  $LOAD_PATH.each do |x|
    if File.exist? File.join(x,'numo/libnarray.a')
      $LDFLAGS = "-L#{x}/numo " + $LDFLAGS
      break
    end
  end
end

def create_depend
  require 'erb'
  message "creating depend\n"
  dep_path = File.join(Dir.pwd, "depend")
  File.open(dep_path, "w") do |dep|
    dep_erb_path = File.join(Dir.pwd, "depend.erb")
    File.open(dep_erb_path, "r") do |dep_erb|
      erb = ERB.new(dep_erb.read)
      erb.filename = dep_erb_path
      dep.print(erb.result)
    end
  end
end
