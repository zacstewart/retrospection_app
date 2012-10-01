class User < ActiveRecord::Base
  ACCESSIBLE_ATTRS = [:email, :password, :password_confirmation, :remember_me].freeze
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :retrospections
  has_many :sleeps
  has_many :trackables

  attr_accessible *ACCESSIBLE_ATTRS

  def anonymous?
    self.is_a? AnonymousUser
  end
end
