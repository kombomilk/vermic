# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vermic/version"

Gem::Specification.new do |s|
  s.name        = "vermic"
  s.version     = Vermic::VERSION
  s.authors     = ["Sergey Kim"]
  s.email       = ["skim1776@gmail.com"]
  s.homepage    = "http://www.github.com/skim1776/vermic"
  s.summary     = %q{Pastes your code to the pastebin.com}
  s.description = %q{I often need to paste my code to some place with public access in order to ask questions.
 This utility makes this process easier.}

  s.rubyforge_project = "vermic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
   s.add_runtime_dependency "clipboard"
end
