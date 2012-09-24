class Retrospection < ActiveRecord::Base
  include PgSearch
  DATE_REGEX = /\d{4}-\d{1,2}-\d{1,2}/.freeze
  
  attr_accessible :body, :retrospected_on
  validates :body, :retrospected_on, presence: true
  
  scope :chronological, order('retrospected_on DESC')
  pg_search_scope :search, against: :body,
    using: {tsearch: {dictionary: "english"}}
    
  def self.find(param)
    if param =~ DATE_REGEX
      find_or_initialize_by_retrospected_on(param)
    else
      super(param)
    end
  end
  
  def to_param
    retrospected_on
  end
  
  def today_or_later?
    retrospected_on >= Date.today
  end
end
