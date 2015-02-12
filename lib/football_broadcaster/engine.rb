module FootballBroadcaster
  class Engine < ::Rails::Engine
    isolate_namespace FootballBroadcaster

    config.generators do |g|
      g.test_framework :rspec, view_specs: false
    end
  end
end

require 'simple_form'
require 'responders'