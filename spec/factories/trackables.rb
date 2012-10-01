# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trackable do
    user nil
    name "MyString"
    unit "MyString"
  end
end
