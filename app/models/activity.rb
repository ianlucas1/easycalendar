class Activity < ApplicationRecord
  has_many :coach_activities
  has_many :coaches, through: :coach_activities

  validates :name, presence: true, uniqueness: true
end
