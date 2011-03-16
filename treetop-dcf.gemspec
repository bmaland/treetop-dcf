# -*- coding: utf-8 -*-

require "lib/dcf"

Gem::Specification.new do |s|
  s.name = %q{treetop-dcf}
  s.rubyforge_project = %q{treetop-dcf}
  s.version = Dcf.version
  s.platform = Gem::Platform::RUBY
  s.authors = ["Bjørn Arild Mæland"]
  s.email = %q{bjorn.maeland@gmail.com}
  s.homepage = %q{http://github.com/bmaland/treetop-dcf}
  s.license = "MIT"
  s.required_rubygems_version = ">= 1.3.6"
  s.description = %q{Easy to use parser for Debian Control Files.}
  s.summary = %q{Easy to use parser for Debian Control Files.}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "lib/dcf.rb",
    "lib/dcf_grammar.treetop"
  ]
  s.require_paths = ["lib"]
  s.test_files = [
    "test/helper.rb",
    "test/suite.rb",
    "test/test_dcf.rb"
  ]

  s.add_dependency "treetop", ">= 1.2.5"

  s.add_development_dependency "shoulda"
end

