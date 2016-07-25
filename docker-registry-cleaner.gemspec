# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docker/registry/cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "docker-registry-cleaner"
  spec.version       = Docker::Registry::Cleaner::VERSION
  spec.authors       = ["Martin Prebio"]
  spec.email         = ["martin.prebio@gmail.com"]

  spec.summary       = %q{Cleanup script for a docker registry}
  spec.description   = %q{Cleaner for docker's registry. It deletes stale images to save disk space.}
  spec.homepage      = "https://github.com/25th-floor/docker-registry-cleaner"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
