# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retrospection do
    association :user
    retrospected_on { Date.today }
    body "Binks ate a ladybug today"
  end
end
