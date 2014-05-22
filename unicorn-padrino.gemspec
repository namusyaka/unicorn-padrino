# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicorn/padrino/version'

Gem::Specification.new do |spec|
  spec.name          = "unicorn-padrino"
  spec.version       = Unicorn::Padrino::VERSION
  spec.authors       = ["namusyaka"]
  spec.email         = ["namusyaka@gmail.com"]
  spec.summary       = %q{Adds unicorn as an adapter to your padrino start command.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/namusyaka/unicorn-padrino"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "unicorn"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
