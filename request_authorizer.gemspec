$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authorize_request/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authorize_request"
  s.version     = AuthorizeRequest::VERSION
  s.authors     = ["Marcelo Junior"]
  s.email       = ["juniormesquitadandao@gmail.com"]
  s.homepage    = "https://github.com/juniormesquitadandao/authorize_request"
  s.summary     = "AuthorizeRequest"
  s.description = "AuthorizeRequest"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
