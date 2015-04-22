# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calmotron/version'

Gem::Specification.new do |spec|
  spec.name          = "calmotron"
  spec.version       = Calmotron::VERSION
  spec.authors       = ["Daniel Sullivan"]
  spec.email         = ["danielalexandersullivan@gmail.com"]
  spec.summary       = "Semi-randomly generate harmonious ambient music"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "midilib", "~> 2.0.4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.6.0"
  spec.add_development_dependency "pry"
end
