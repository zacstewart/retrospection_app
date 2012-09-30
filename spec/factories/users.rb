# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password 'secret'
    password_confirmation 'secret'
  end
end
