require "bundler/gem_tasks"

task :doc do
  srcs = []
  Dir.glob("ext/numo/gsl/*").each do |d|
    if File.exist?(d+"/extconf.rb")
      sh "cd #{d}; ruby extconf.rb; make clean; make src"
      srcs << d+"/*.c"
    end
  end
  sh "yard -m markdown -r README.md #{srcs.join(' ')}"
end

task :cleandoc do
  sh "rm -r doc .yardoc"
end
