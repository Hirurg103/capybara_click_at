
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capybara_click_at/version"

Gem::Specification.new do |spec|
  spec.name          = "capybara_click_at"
  spec.version       = CapybaraClickAt::VERSION
  spec.authors       = ["Dzmitry"]
  spec.email         = ["dzm.kovk@gmail.com"]

  spec.summary       = %q{Adds click_at(x, y) Capybara helper}
  spec.description   = %{Sometimes I want to click at some point on a map in the tests. This gem adds click_at(point) helper which serves the need}
  spec.homepage      = "https://github.com/Hirurg103/capybara_click_at"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "capybara", "~> 3.5"
  spec.add_development_dependency "selenium-webdriver", "~> 3.14"
  spec.add_development_dependency "capybara-webkit", "~> 1.15"
  spec.add_development_dependency "poltergeist", "~> 1.18"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "puma", "~> 3.12"
  spec.add_development_dependency "appraisal", "~> 2.2"
end
