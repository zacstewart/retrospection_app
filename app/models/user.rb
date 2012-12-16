class User < ActiveRecord::Base
  ACCESSIBLE_ATTRS = [:email, :password, :password_confirmation, :remember_me].freeze
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :oauth2_providable, :oauth2_password_grantable,
    :oauth2_refresh_token_grantable, :oauth2_authorization_code_grantable

  has_many :retrospections
  has_many :sleeps
  has_many :trackables

  attr_accessible *ACCESSIBLE_ATTRS

  def anonymous?
    self.is_a? AnonymousUser
  end
end
