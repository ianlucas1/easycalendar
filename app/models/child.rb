class Child < ApplicationRecord
  belongs_to :client, class_name: "User"
  has_many :appointments
end
