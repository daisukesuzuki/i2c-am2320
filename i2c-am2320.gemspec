# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i2c/drivers/am2320/version'

Gem::Specification.new do |spec|
  spec.name          = 'i2c-am2320'
  spec.version       = I2C::Drivers::AM2320::VERSION
  spec.authors       = ['Daisuke SUZUKI']
  spec.email         = ['daisuke.suzuki@gmail.com']
  spec.description   = %q{Ruby driver for AM2320 temperature and humidity combined sensor}
  spec.summary       = %q{Driver for the AM2320 temparature and humidity sensor}
  spec.homepage      = 'https://github.com/daisukesuzuki/i2c-am2320'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'i2c'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-minitest'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'pry-byebug'
end
