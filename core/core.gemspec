$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "core"
  s.version     = Core::VERSION
  s.authors     = ["Lance Woodson"]
  s.email       = ["lance@webmaneuvers.com"]
  s.summary     = "Core classes"
  s.description = "Core classes like models and such"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "schema_plus"

  s.add_development_dependency "pg"
  s.add_development_dependency "pry-byebug"
end
