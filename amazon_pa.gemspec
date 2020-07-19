
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "amazon_pa/version"

Gem::Specification.new do |spec|
  spec.name          = "amazon_pa"
  spec.version       = AmazonPa::VERSION
  spec.authors       = ["miraoto"]
  spec.email         = ["miraoto@gmail.com"]

  spec.summary       = %q{Easy using Amazon Product Advertising API for Ruby.}
  spec.description   = %q{amazon_pa is easy to access Amazon Product Advertising API.}
  spec.homepage      = "https://github.com/miraoto/amazon_pa."
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency 'pry'
end
