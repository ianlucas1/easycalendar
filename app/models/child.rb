class Child < ApplicationRecord
  belongs_to :parent, class_name: "User"
  has_many :appointments

  validates :parent, presence: true
end
