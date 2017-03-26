require "erb"

class ErbPP

  def initialize(parent=nil, erb_base=nil, **opts, &block)
    @parent = parent
    @children = []
    @opts = opts
    set erb_base: erb_base if erb_base
    @parent.add_child(self) if @parent
    instance_eval(&block) if block
  end

  attr_reader :children
  attr_accessor :parent

  def add_child(child)
    @children.push(child)
  end

  def set(**opts)
    @opts.merge!(opts)
  end

  def get(key, *args, &block)
    if respond_to?(key)
      return send(key, *args, &block)
    end
    if args.empty? && block.nil? && @opts.has_key?(key)
      return @opts[key]
    end
    if @parent
      return @parent.get(key, *args, &block)
    end
    nil
  end

  def description
    if s = @opts[:description] || @opts[:desc]
      s.gsub(/\@\{/,"[").gsub(/\@\}/,"]")
    end
  end

  alias desc description

  alias method_missing_alias method_missing

  def method_missing(_meth_id, *args, &block)
    if args.empty?
      #$stderr.puts _meth_id.inspect
      v = get(_meth_id, *args, &block)
      return v if !v.nil?
    end
    method_missing_alias(_meth_id, *args, &block)
  end

  # ERB Loader

  def load_erb(base_name)
    safe_level = nil
    trim_mode = '%<>'
    file = base_name + get(:erb_suffix)
    dirs = get(:erb_dir)
    dirs = [dirs] if !dirs.kind_of?(Array)
    dirs.each do |x|
      Dir.glob(x).each do |dir|
        path = File.join(dir,file)
        if File.exist?(path)
          erb = ERB.new(File.read(path), safe_level, trim_mode)
          erb.filename = path
          return erb
        end
      end
    end
    raise "file not found: #{file.inspect} in #{dirs.inspect}"
  end

  def run
    if base = @opts[:erb_base]
      load_erb(base).run(binding)
    end
  end

  def result
    if base = @opts[:erb_base]
      load_erb(base).result(binding)
    end
  end

  def init_def
  end
end


class DefLib < ErbPP
  def initialize(parent=nil, **opts, &block)
    opts[:erb_base] ||= 'lib'
    super(parent, **opts, &block)
  end
  def id_assign
    ids = []
    @children.each{|c| a=c.get(:id_list); ids.concat(a) if a}
    ids.sort.uniq.map{|x| "id_#{x} = rb_intern(\"#{x}\");"}
  end
  def id_decl
    ids = []
    @children.each{|c| a=c.get(:id_list); ids.concat(a) if a}
    ids.sort.uniq.map{|x| "ID id_#{x};"}
  end
  def def_class(**opts, &block)
    DefClass.new(self, **opts, &block)
  end
  def def_module(**opts, &block)
    DefModule.new(self, **opts, &block)
  end
end

class DefModule < ErbPP
  def initialize(parent, **opts, &block)
    opts[:erb_base] ||= 'module'
    super(parent, **opts, &block)
  end
  def id_list
    @id_list ||= []
  end
  def add_id(id)
    id_list << id
  end
  def init_def
    load_erb(init_erb).result(binding)
  end
  def init_erb
    @opts[:init_erb] || "init_module"
  end
  def method_code
    @children.map{|c| c.result}.join("\n")
  end
  def undef_alloc_func
    UndefAllocFunc.new(self)
  end
  def def_method(m, erb_path, **opts, &block)
    DefMethod.new(self, erb_path, name:m, **opts, &block)
  end
  def def_singleton_method(m, erb_path, **opts, &block)
    DefMethod.new(self, erb_path, name:m, singleton:true, **opts, &block)
  end
  def def_alias(from, to)
    DefAlias.new(self, from:from, to:to)
  end
  def def_const(m, v, **opts, &block)
    DefConst.new(self, name:m, value:v, **opts, &block)
  end
  def _mod_var
    @opts[:module_var]
  end
end

class DefClass < DefModule
  def initialize(parent, **opts, &block)
    opts[:erb_base] ||= 'class'
    super(parent, **opts, &block)
  end
  def _mod_var
    @opts[:class_var]
  end
  def init_erb
    @opts[:init_erb] || "init_class"
  end
  def super_class
    @opts[:super_class] || "rb_cObject"
  end
end

class DefMethod < ErbPP
  def initialize(parent, erb_base, **opts, &block)
    super(parent, **opts, &block)
    set erb_base: erb_base
  end

  def c_func(n_arg=nil)
    set n_arg: n_arg if n_arg
    s = (singleton) ? "_s" : ""
    "#{@parent.name}#{s}_#{@opts[:name]}"
  end

  def init_def
    s = (singleton) ? "_singleton" : ""
    "rb_define#{s}_method(#{_mod_var}, \"#{@opts[:name]}\", #{c_func}, #{n_arg});"
  end

  def singleton
    @opts[:singleton]
  end
end

class DefAlias < ErbPP
  def init_def
    "rb_define_alias(#{_mod_var}, \"#{from}\", \"#{to}\");"
  end
end

class UndefAllocFunc < ErbPP
  def init_def
    "rb_undef_alloc_func(#{_mod_var});"
  end
end

class DefConst < ErbPP
  def init_def
    "/*#{desc}*/
    rb_define_const(#{_mod_var},\"#{name}\",#{value});"
  end
end

class DefStruct < ErbPP
  def method_code
    "static VALUE #{class_var};"
  end
  def init_def
    items = members.map{|s| "\"#{s}\""}.join(",")
    "/*#{description}*/
    #{class_var} = rb_struct_define(\"#{class_name}\",#{items},NULL);"
  end
end
