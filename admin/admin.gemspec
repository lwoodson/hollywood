$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin"
  s.version     = Admin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Admin."
  s.description = "TODO: Description of Admin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "haml"
  s.add_dependency "haml-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "bootstrap-datepicker-rails"
  s.add_dependency "bootstrap_form"
  s.add_dependency "virtus"

  s.add_development_dependency "pg"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "database_cleaner"
end
