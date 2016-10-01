class Message < ApplicationRecord
  belongs_to :notification
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :appointment, through: :notification
end
