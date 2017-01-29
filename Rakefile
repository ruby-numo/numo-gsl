require "bundler/gem_tasks"

task :doc do
  sh "yard -m markdown -r README.md ext/numo/gsl/*/*.c"
end

task :cleandoc do
  sh "rm -r doc .yardoc"
end
