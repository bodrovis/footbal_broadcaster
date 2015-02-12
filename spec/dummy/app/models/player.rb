class Player < ActiveRecord::Base
  belongs_to :team

  def full_name
    "#{surname}, #{name}"
  end
end
