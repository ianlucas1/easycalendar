class Message < ApplicationRecord
  belongs_to :notification
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_one :appointment, through: :notification

  validates :notification, presence: true
  validates :sender, presence: true
  validates :receiver, presence: true
  validates :content, presence: true
end