# -*- coding: utf-8 -*-
require 'rake'
require 'rake/testtask'

begin
  gem 'jeweler', '>= 1.3.0'
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "treetop-dcf"
    s.summary = "Easy to use parser for Debian Control Files."
    s.email = "bjorn.maeland@gmail.com"
    s.homepage = "http://github.com/Chrononaut/treetop-dcf"
    s.description = "Easy to use parser for Debian Control Files."
    s.authors = ["Bjørn Arild Mæland"]
    s.files = "lib/*.*"
    s.add_dependency('treetop', '>= 1.2.5')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler --version '>= 1.3.0'"
  exit(1)
end

Jeweler::GemcutterTasks.new

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r dcf.rb"
end

desc "Benchmark"
task :bench do
  def time(times=1)
    require "benchmark"
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end
  load "lib/dcf.rb"
  time { Dcf.parse(File.read("test/data/PACKAGES")) }
end
