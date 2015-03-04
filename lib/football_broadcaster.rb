require "football_broadcaster/engine"

require 'sass'
require "cocoon"
require 'bootstrap-sass'
require "handlebars_assets"

module FootballBroadcaster
  mattr_accessor :team_class, :player_class, :layout

  class << self
    def team_class
      if @@team_class.is_a?(Class)
        raise "You can't set team_class to be a class. Please use string instead."
      elsif @@team_class.is_a?(String)
        begin
          Object.const_get(@@team_class)
        rescue NameError
          @@team_class.constantize
        end
      end
    end

    def player_class
      if @@player_class.is_a?(Class)
        raise "You can't set player_class to be a class. Please use string instead."
      elsif @@player_class.is_a?(String)
        begin
          Object.const_get(@@player_class)
        rescue NameError
          @@player_class.constantize
        end
      end
    end

    def layout
      @@layout || "football_broadcaster/application"
    end
  end
end
