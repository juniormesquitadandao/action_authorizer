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
  s.summary     = "ActionAuthorizer"
  s.description = "ActionAuthorizer"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
end