# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_set_match/version'

Gem::Specification.new do |spec|
  spec.name          = "game_set_match"
  spec.version       = GameSetMatch::VERSION
  spec.authors       = ["Piper Gragg"]
  spec.email         = ["pipergragg@gmail.com"]

  spec.summary       = %q{Allow matching of terms in two enumerable sets.}
  spec.homepage      = "https://github.com/pgragg/game_set_match"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
