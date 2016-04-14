require 'rake'
require 'rake/testtask'

desc 'Run Tests'
task :test do
  Dir['./spec/**/*_spec.rb'].each { |f| load f }
end

desc 'Run Build'
task :build do
  exec 'bundle install'
end

desc 'Run Tsp'
task :run do
  exec 'ruby bin/tsp.rb'
end

task :default => :run
