class Tracking < ActiveRecord::Base
  belongs_to :trackable
  attr_accessible :quantity
end
