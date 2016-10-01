class Location < ApplicationRecord
  has_many :appointments
  has_many :client_locations

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true  
end
