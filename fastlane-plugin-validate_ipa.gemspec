lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/validate_ipa/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-validate_ipa'
  spec.version       = Fastlane::ValidateIpa::VERSION
  spec.author        = 'hacoma'
  spec.email         = 'hacoma92@gmail.com'

  spec.summary       = 'Validate the IPA using altool.'
  spec.homepage      = "https://github.com/hacoma/fastlane-plugin-validate_ipa"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.196.0')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '1.12.1')
  spec.add_development_dependency('rubocop-performance')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
