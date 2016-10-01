class Appointment < ApplicationRecord
  belongs_to :child
  belongs_to :location
  has_one :client, through: :child, source: :client # NEED TO MAKE THROUGH WORK
  belongs_to :coach_activity
  has_one :coach, through: :coach_activity
end
