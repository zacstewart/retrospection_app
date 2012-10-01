# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracking do
    trackable nil
    quantity 1.5
  end
end
