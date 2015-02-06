$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "football_broadcaster/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "football_broadcaster"
  s.version     = FootballBroadcaster::VERSION
  s.authors     = ["bodrovis"]
  s.email       = ["golosizpru@gmail.com"]
  s.homepage    = "http://radiant-wind.com"
  s.summary     = "Broadcast footbal."
  s.description = "Broadcast footbal."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "annotate"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails", "3.1.0"
  s.add_development_dependency "capybara", "2.4.4"
  s.add_development_dependency 'sass-rails', '~> 5.0'
  s.add_development_dependency 'coffee-rails', '~> 4.1'
end