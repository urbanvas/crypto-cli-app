
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crypto/version"
require './lib/crypto/coin'
require './lib/crypto/controller'
require './lib/crypto/data'

Gem::Specification.new do |spec|
  spec.name          = "crypto"
  spec.version       = Crypto::VERSION
  spec.authors       = ['Neil']
  spec.email         = ['nvseejoor@gmail.com']

  spec.summary       = 'This gem scrapes data about crypto prices'
  spec.description   = 'Pulls data from CoinMarketCap'
  spec.homepage      = 'https://github.com/urbanvas/crypto-cli-app'
  spec.license       = "MIT"



  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
