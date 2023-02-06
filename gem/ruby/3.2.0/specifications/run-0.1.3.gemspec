# -*- encoding: utf-8 -*-
# stub: run 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "run".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["sergioro".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-02-13"
  s.description = "Increase typing speed and keep track of WPM history".freeze
  s.email = ["yo@sergioro.com".freeze]
  s.executables = ["run".freeze]
  s.files = ["exe/run".freeze]
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Increase your typing speed".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0.1"])
  s.add_development_dependency(%q<benchmark-ips>.freeze, [">= 0"])
  s.add_development_dependency(%q<byebug>.freeze, ["~> 11.0.1"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
  s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1.3.8"])
end
