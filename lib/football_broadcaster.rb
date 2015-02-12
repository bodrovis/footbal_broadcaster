require "football_broadcaster/engine"

require "cocoon"
require "handlebars_assets"

module FootballBroadcaster
  mattr_accessor :team_class

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
  end
end
