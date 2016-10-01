FactoryGirl.define do
  factory :appointment do
    coach_activity
    child
    location
    association :client, email: "martharuth1@gmail.com"
  end
end