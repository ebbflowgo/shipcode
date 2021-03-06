# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra/auth/github/version"

Gem::Specification.new do |s|
  s.name        = "shipcode"
  s.version     = Sinatra::Auth::Github::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Christopher Dolinski"]
  s.email       = ["christopher.dolinski@gmail.com"]
  s.homepage    = "http://github.com/ebbflowgo/shipcode"
  s.summary     = "A GitHub commit tracker"
  s.license     = "MIT"
  s.description = s.summary

  # s.rubyforge_project = "shipcode"

  s.add_dependency "sinatra",       "~>1.0"
  s.add_dependency "warden-github", "~>1.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec",     "~>2.4.0"
  s.add_development_dependency "shotgun"
  s.add_development_dependency "randexp",   "~>0.1.5"
  s.add_development_dependency "rack-test", "~>0.5.3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
