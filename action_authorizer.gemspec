$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_authorizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name                  = "action_authorizer"
  s.version               = ActionAuthorizer::VERSION.dup
  s.platform              = Gem::Platform::RUBY
  s.license               = "MIT"
  s.summary               = "Action Authorizer"
  s.email                 = "juniormesquitadandao@gmail.com"
  s.homepage              = "https://github.com/juniormesquitadandao/action_authorizer"
  s.description           = "ActionAuthorizer is a gem to authorize the controllers's actions. Designed to work with Devise and RSpec. Where each controller will have an authorizer with the same actions. Each authorizer's action will return your permission's result."
  s.authors               = ["Marcelo Junior"]

  s.files                 = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md", "*.gemspec"]
  s.require_paths         = ["lib"]
  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency("rails", ">= 4.1.0", "< 5.0")
end