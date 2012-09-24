class Sleep < ActiveRecord::Base
  belongs_to :user

  attr_accessible :slept_at, :woke_at
  
  scope :chronological, order('woke_at DESC')
end
