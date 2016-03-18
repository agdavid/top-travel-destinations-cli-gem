# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top_travel_destinations/version'

Gem::Specification.new do |spec|
  spec.name          = "top-travel-destinations-cli-gem"
  spec.version       = TopTravelDestinations::VERSION
  spec.authors       = ["Antonio David"]
  spec.email         = ["antonio.david.us@gmail.com"]

  spec.summary       = %q{Top travel destinations by region of the world.}
  spec.description   = %q{Top travel destinations by region of the world, according to TripAdvisor.}
  spec.homepage      = "https://github.com/agdavid/top-travel-destinations-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
    #raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #spec.bindir        = "exe"
  spec.executables   = ["top-travel-destinations"]
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/top_travel_destinations"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.0"
  spec.add_development_dependency "pry", "~> 0"
end
