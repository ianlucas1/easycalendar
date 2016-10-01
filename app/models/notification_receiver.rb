class NotificationReceiver < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :notification

  validates :notification, presence: true
  validates :receiver, presence: true
end
