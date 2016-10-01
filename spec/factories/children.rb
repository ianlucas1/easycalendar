FactoryGirl.define do
  factory :child do
    first_name "Baby"
    last_name "Ruth"
    age 9
    association :parent, factory: :client
  end
end