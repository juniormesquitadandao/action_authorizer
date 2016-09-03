$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_authorizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "action_authorizer"
  s.version     = ActionAuthorizer::VERSION
  s.authors     = ["Marcelo Junior"]
  s.email       = ["juniormesquitadandao@gmail.com"]
  s.homepage    = "https://github.com/juniormesquitadandao/action_authorizer"
  s.summary     = "Action Authorizer"
  s.description = "ActionAuthorizer is a gem to authorize the controllers's actions. Designed to work with Devise and RSpec. Where each controller will have an authorizer with the same actions. Each authorizer's action will return your permission's result."
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 4.2.0", "< 5.1"
end