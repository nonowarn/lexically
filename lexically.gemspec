
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lexically/version"

Gem::Specification.new do |spec|
  spec.name          = "lexically"
  spec.version       = Lexically::VERSION
  spec.authors       = ["nonowarn"]
  spec.email         = ["nonowarn@gmail.com"]

  spec.summary       = %q{Provides "lexically" visibility to classes or modules}
  spec.description   = %q{Using refinements mechanisms, this module provides defning methods cannot be called from outside of the classes or modules}
  spec.homepage      = "http://nonowarn.jp"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
