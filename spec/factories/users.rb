FactoryGirl.define do
  factory :client, class: User do
    first_name "Martha"
    last_name "Ruth"
    email "martharuth@gmail.com"
    password "password"
  end

  factory :coach, class: User do
    first_name "Michelle"
    last_name "Kwan"
    email "michellekwan@gmail.com"
    password "password"
  end
end
