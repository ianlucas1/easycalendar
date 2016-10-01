FactoryGirl.define do
  factory :message do
    notification
    association :sender, factory: :coach, email: "michellekwan2@gmail.com"
    association :receiver, factory: :client, email: "martharuth2@gmail.com"
    content "Y"
  end
end