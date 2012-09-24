class Retrospection < ActiveRecord::Base
  include PgSearch
  DATE_REGEX = /\d{4}-\d{1,2}-\d{1,2}/.freeze
  
  belongs_to :user
  
  attr_accessible :body, :retrospected_on
  
  validates :user_id, :body, :retrospected_on, presence: true
  validate :retrospection_cannot_be_speculation
  
  scope :chronological, order('retrospected_on DESC')
  pg_search_scope :search, against: :body,
    using: {tsearch: {dictionary: "english"}}
    
  def self.find_by_param(param)
    if param =~ DATE_REGEX
      find_or_initialize_by_retrospected_on(param)
    else
      find(param)
    end
  end
  
  def retrospection_cannot_be_speculation
    if retrospected_on > Date.today
      errors.add(:retrospected_on, "Can't be later than today")
    end
  end
  
  def to_param
    retrospected_on
  end
  
  def today_or_later?
    retrospected_on >= Date.today
  end
end
