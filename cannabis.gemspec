# -*- encoding: utf-8 -*-
require File.expand_path("../lib/cannabis/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "cannabis"
  s.version     = Cannabis::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jakub Kuźma"]
  s.email       = ["qoobaa@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/cannabis"
  s.summary     = "Simple permissions system"
  s.description = "Simple permissions that I have used on my last several projects so I figured it was time to abstract and wrap up into something more easily reusable."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "cannabis"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
