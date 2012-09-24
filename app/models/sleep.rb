class Sleep < ActiveRecord::Base
  attr_accessible :slept_at, :woke_at
  
  scope :chronological, order('woke_at DESC')
end
