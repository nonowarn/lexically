
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lexically/version"

Gem::Specification.new do |spec|
  spec.name          = "lexically"
  spec.version       = Lexically::VERSION
  spec.authors       = ["nonowarn"]
  spec.email         = ["nonowarn@gmail.com"]
  spec.licenses    = ['MIT']

  spec.summary       = %q{Defining methods cannot be called from derived class.}
  spec.description   = %q{Using the refinements mechanism, This gem allows you to mark methods with the visibility like `private`, but it's more like Java's or PHP's `private`. i.e. `lexically` defines methods cannot be called from derived class.}
  spec.homepage      = "http://nonowarn.jp"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
