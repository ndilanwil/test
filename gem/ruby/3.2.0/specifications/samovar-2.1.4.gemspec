# -*- encoding: utf-8 -*-
# stub: samovar 2.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "samovar".freeze
  s.version = "2.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Samuel Williams".freeze]
  s.date = "2020-01-26"
  s.email = ["samuel.williams@oriontransfer.co.nz".freeze]
  s.homepage = "https://github.com/ioquatix/samovar".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.1".freeze
  s.summary = "Samovar is a flexible option parser excellent support for sub-commands and help documentation.".freeze

  s.installed_by_version = "3.4.1" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<mapping>.freeze, ["~> 1.0"])
  s.add_runtime_dependency(%q<console>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<covered>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6"])
end
