class NotificationReceiver < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :notification
end
