FactoryGirl.define do
  factory :notification_receiver do
    notification
    association :receiver, factory: :client, email: "martharuth3@gmail.com"
  end
end