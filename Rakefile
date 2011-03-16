# -*- coding: utf-8 -*-
require 'rake'
require 'rake/testtask'

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
