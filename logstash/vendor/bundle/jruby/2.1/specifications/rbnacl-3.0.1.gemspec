# -*- encoding: utf-8 -*-
# stub: rbnacl 3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rbnacl"
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tony Arcieri", "Jonathan Stott"]
  s.cert_chain = ["bascule.cert"]
  s.date = "2014-05-13"
  s.description = "Ruby binding to the Networking and Cryptography (NaCl) library"
  s.email = ["tony.arcieri@gmail.com", "jonathan.stott@gmail.com"]
  s.homepage = "https://github.com/cryptosphere/rbnacl"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "The Networking and Cryptography (NaCl) library provides a high-level toolkit for building cryptographic systems and protocols"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.14"])
      s.add_development_dependency(%q<rubocop>, [">= 0"])
    else
      s.add_dependency(%q<ffi>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.14"])
      s.add_dependency(%q<rubocop>, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.14"])
    s.add_dependency(%q<rubocop>, [">= 0"])
  end
end
