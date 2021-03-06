class Invite < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :coach_activity
  has_one :coach, through: :coach_activity
  has_one :activity, through: :coach_activity

  validates :client, presence: true
  validates :coach_activity, presence: true
end
