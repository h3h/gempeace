# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gempeace/version'

Gem::Specification.new do |spec|
  spec.name          = "gempeace"
  spec.version       = Gempeace::VERSION
  spec.authors       = ["Brad Fults"]
  spec.email         = ["bfults@gmail.com"]
  spec.description   = %q{Allows you to push gems to your own S3 bucket.}
  spec.summary       = %q{Host your own gems on S3.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "aws-sdk", "~> 1.10"
  spec.add_runtime_dependency "thor", "~> 0.17"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
end
