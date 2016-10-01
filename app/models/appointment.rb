class Appointment < ApplicationRecord
  belongs_to :child
  belongs_to :location
  has_one :client, through: :child, source: :parent
  belongs_to :coach_activity
  has_one :coach, through: :coach_activity
  has_many :notifications

  validates :location, presence: true
  validates :coach_activity, presence: true
  validates :coach, presence: true
end
