# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smoresms/version'

Gem::Specification.new do |spec|
  spec.name          = "smoresms"
  spec.version       = SmoreSMS::VERSION
  spec.authors       = ["Douglas Pouk"]
  spec.email         = ["support@flyonlinetools.com"]
  spec.summary       = %q{Send SMS messages from Ruby on Rails.}
  spec.description   = %q{Send SMS messages from Ruby on Rails, easily and cleanly.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "validates_phone_number"
end
