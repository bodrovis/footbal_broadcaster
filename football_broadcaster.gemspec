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
  s.summary     = "Broadcast football."
  s.description = "Broadcast football."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "cocoon", "~> 1.2.6"
  s.add_dependency 'simple_form', '~> 3.1.0'
  s.add_dependency 'responders', '~> 2.0'
  s.add_dependency 'handlebars_assets', '~> 0.18'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "annotate"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails", "3.2.1"
  s.add_development_dependency "capybara", "2.4.4"
  s.add_development_dependency 'selenium-webdriver', '2.45.0.dev3'
  s.add_development_dependency 'sass-rails', '~> 5.0'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'coffee-rails', '~> 4.1'
  s.add_development_dependency 'factory_girl_rails', '4.5.0'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'database_cleaner', '~> 1.4.0'
end
