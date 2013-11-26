# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usno/eclipse/solar/version'

Gem::Specification.new do |spec|
  spec.name          = "usno-eclipse-solar"
  spec.version       = USNO::Eclipse::Solar::VERSION
  spec.authors       = ["Ryan T. Hosford"]
  spec.email         = ["tad.hosford@gmail.com"]
  spec.description   = %q{Obtain the circumstances of recent and upcoming solar eclipses for any location}
  spec.summary       = %q{}
  spec.homepage      = "http://ea.rthbound.com/usno"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "pay_dirt"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "minitest"
end
