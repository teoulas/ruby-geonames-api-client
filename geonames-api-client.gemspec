# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geonames/version'

Gem::Specification.new do |spec|
  spec.name          = "geonames-api-client"
  spec.version       = Geonames::VERSION
  spec.authors       = ["Theodoros Orfanidis"]
  spec.email         = ["teoulas@gmail.com"]
  spec.description   = %q{Simple client for geonames.org web services}
  spec.summary       = %q{Simple client for geonames.org web services. Supports very few methods, handles errors, returns plain old ruby hashes. Feel free to extend!}
  spec.homepage      = "https://github.com/teoulas/ruby-geonames-api-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.8"
  spec.add_development_dependency "fakeweb", "~> 1.3.0"

  spec.add_runtime_dependency "hashie", "~> 2.0.5"
end
