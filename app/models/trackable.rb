class Trackable < ActiveRecord::Base
  belongs_to :user
  has_many :trackings
  attr_accessible :name, :unit
end
