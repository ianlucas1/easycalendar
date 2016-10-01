class ClientLocation < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :location
end
