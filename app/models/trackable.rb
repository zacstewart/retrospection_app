class Trackable < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :unit
end
