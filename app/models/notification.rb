class Notification < ApplicationRecord
  belongs_to :appointment
  has_many :messages
  has_many :notification_receivers
  has_many :receivers, through: :notification_receivers
end
