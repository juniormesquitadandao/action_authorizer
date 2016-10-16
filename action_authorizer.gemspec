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
  s.description           = "Rails authorization with controllers's actions."
  s.authors               = ["Marcelo Junior"]

  s.files                 = Dir["lib/**/*", "MIT-LICENSE", "README.md"]
  s.require_paths         = ["lib"]
  s.required_ruby_version = '>= 1.9'

  s.add_dependency("rails", ">= 3.0")
end