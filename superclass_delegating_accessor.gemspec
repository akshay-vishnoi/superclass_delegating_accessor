# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'superclass_delegating_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = "superclass_delegating_accessor"
  spec.version       = SuperclassDelegatingAccessor::VERSION
  spec.authors       = ["Akshay Vishnoi"]
  spec.email         = ["akshay.vishnoi@yahoo.com"]
  spec.description   = 'A Ruby utility that defines both class and instance accessors for class attributes. Creates private *_attr* and *_attr=* methods that can still be used if the public methods are overridden.'
  spec.summary       = 'A Ruby utility that defines both class and instance accessors for class attributes. Creates private *_attr* and *_attr=* methods that can still be used if the public methods are overridden.'
  spec.homepage      = 'https://github.com/akshay-vishnoi/superclass_delegating_accessor'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3.1"
end
