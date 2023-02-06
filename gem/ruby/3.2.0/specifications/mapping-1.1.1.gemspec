# -*- encoding: utf-8 -*-
# stub: mapping 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mapping".freeze
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Williams".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-03-06"
  s.description = "Map model objects based on their class to a given output model. Useful for versioning external interfaces (e.g. JSON APIs) or processing structured data from one format to another.".freeze
  s.email = ["samuel.williams@oriontransfer.co.nz".freeze]
  s.homepage = "https://github.com/ioquatix/mapping".freeze
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Map an input model to an output model using a mapping model.".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
end
