# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hal9000/version'

Gem::Specification.new do |spec|
  spec.name          = "hal9000"
  spec.version       = HAL9000::VERSION

  spec.authors       = ["David Rodrigues"]
  spec.email         = ["david.ndh@gmail.com"]
  spec.homepage      = "https://github.com/dmcrodrigues/hal9000"
  spec.license       = "MIT"

  spec.description   = "hal uses your thoughts as an alias to your commands. 
  think of what you want to do and hal will run it for you."
  spec.summary       = "hal maps your commands to an human readable form, you 
  just need to think what you want to do and hal will do it for you with pleasure!
  It's like a domain for a not-easy-to-remember ip but for your commands."

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oj", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
