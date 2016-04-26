$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "request_authorizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "request_authorizer"
  s.version     = RequestAuthorizer::VERSION
  s.authors     = ["juniormesquitadandao"]
  s.email       = ["juniormesquitadandao@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RequestAuthorizer."
  s.description = "TODO: Description of RequestAuthorizer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
