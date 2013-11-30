#-*- encoding: utf-8 -*-
VERSION = "0.1.0"

Gem::Specification.new do |spec|
  spec.name          = "motion-distance"
  spec.version       = VERSION
  spec.authors       = ["Will Raxworthy"]
  spec.email         = ["git@willrax.com"]
  spec.description   = %q{Easy distance tracking for iOS RubyMotion projects.}
  spec.summary       = %q{Easy distance tracking for iOS RubyMotion projects.}
  spec.homepage      = ""
  spec.license       = "MIT"

  files = []
  files << "README.md"
  files.concat(Dir.glob("lib/**/*.rb"))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
