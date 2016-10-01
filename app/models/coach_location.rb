class CoachLocation < ApplicationRecord
  belongs_to :coach, class_name: "User"
  belongs_to :location
end
