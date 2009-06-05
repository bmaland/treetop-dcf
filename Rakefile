# -*- coding: utf-8 -*-
require 'rake'
require 'rake/testtask'

begin
  gem 'jeweler', '>= 0.11.0'
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
  puts "Jeweler not available. Install it with: sudo gem install jeweler --version '>= 0.11.0'"
  exit(1)
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r dcf.rb"
end
