# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bar_navi/version'

Gem::Specification.new do |spec|
  spec.name          = "bar_navi"
  spec.version       = BarNavi::VERSION
  spec.authors       = ["Yuto Ogi"]
  spec.email         = ["jacoyutorius@gmail.com"]

  spec.summary       = "Wrapper by ruby of barnavi API"
  spec.description   = "Wrapper by ruby of barnavi API"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_development_dependency "bundler", "~> 1.11"
  # spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "activesupport", "~> 4.2"
  # spec.add_development_dependency "faraday", "~> 0.9"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "faraday"
  spec.add_development_dependency "faraday_middleware"
  spec.add_development_dependency "multi_xml"
end
