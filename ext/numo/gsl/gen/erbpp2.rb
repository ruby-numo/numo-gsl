require "erb"

class ErbPpNode

  def initialize(parent, **opts, &block)
    @parent = parent
    @children = []
    @opts = opts
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
    @opts[:description] || @opts[:desc]
  end

  alias method_missing_alias method_missing

  def method_missing(_meth_id, *args, &block)
    if args.empty?
      v = get(_meth_id, *args, &block)
      return v if !v.nil?
    end
    method_missing_alias(_meth_id, *args, &block)
  end

  def run
  end

  def result
  end
end

class ErbPP < ErbPpNode

  def initialize(parent, erb_base, **opts, &block)
    super(parent, **opts, &block)
    @opts[:erb_base] = erb_base
  end

  def load_erb
    safe_level = nil
    trim_mode = '%<>'
    file = erb_base + get(:erb_suffix)
    dirs = get(:erb_dir)
    dirs = [dirs] if !dirs.kind_of?(Array)
    dirs.each do |x|
      Dir.glob(x).each do |dir|
        path = File.join(dir,file)
        if File.exist?(path)
          @erb = ERB.new(File.read(path), safe_level, trim_mode)
          @erb.filename = path
          return path
        end
      end
    end
    raise "file not found: #{file.inspect} in #{dirs.inspect}"
  end

  def run
    load_erb unless @erb
    @erb.run(binding)
  end

  def result
    load_erb unless @erb
    @erb.result(binding)
  end
end

class DefLib < ErbPP
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
  def def_class(erb_path, **opts, &block)
    DefClass.new(self, erb_path, **opts, &block)
  end
  def def_module(erb_path, **opts, &block)
    DefModule.new(self, erb_path, **opts, &block)
  end
end

class DefModule < ErbPP
  def id_list
    @id_list ||= []
  end
  def add_id(id)
    id_list << id
  end
  def init_func
    "init_#{name}"
  end
  def call_init
    "#{init_func}(#{namespace_var});"
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
  def _mod_var
    @opts[:module_var]
  end
end

class DefClass < DefModule
  def _mod_var
    @opts[:class_var]
  end
end

class DefMethod < ErbPP
  def c_func
    s = (singleton) ? "_s" : ""
    "#{@parent.name}#{s}_#{name}"
  end

  def define
    s = (singleton) ? "_singleton" : ""
    "rb_define#{s}_method(#{_mod_var}, \"#{name}\", #{c_func}, #{n_arg});"
  end

  def singleton
    @opts[:singleton]
  end
end

class DefAlias < ErbPpNode
  def define
    "rb_define_alias(#{_mod_var}, \"#{from}\", \"#{to}\");"
  end
end

class UndefAllocFunc < ErbPpNode
  def define
    "rb_undef_alloc_func(#{_mod_var});"
  end
end
