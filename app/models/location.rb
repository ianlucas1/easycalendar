class Location < ApplicationRecord
  has_many :appointments
  has_many :client_locations
end
