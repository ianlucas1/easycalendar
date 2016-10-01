class CoachActivity < ApplicationRecord
  belongs_to :coach, class_name: "User"
  belongs_to :activity
end
