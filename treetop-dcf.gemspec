# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{treetop-dcf}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bjørn Arild Mæland"]
  s.date = %q{2009-06-06}
  s.description = %q{Easy to use parser for Debian Control Files.}
  s.email = %q{bjorn.maeland@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "lib/dcf.rb",
     "lib/dcf_grammar.treetop"
  ]
  s.homepage = %q{http://github.com/Chrononaut/treetop-dcf}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Easy to use parser for Debian Control Files.}
  s.test_files = [
    "test/test_dcf.rb",
     "test/helper.rb",
     "test/suite.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treetop>, [">= 1.2.5"])
    else
      s.add_dependency(%q<treetop>, [">= 1.2.5"])
    end
  else
    s.add_dependency(%q<treetop>, [">= 1.2.5"])
  end
end
