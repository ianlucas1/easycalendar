require 'rails_helper'

RSpec.describe ClientLocation, type: :model do

  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:client_location) { ClientLocation.create!(client_id: mom.id, location_id: iceArena.id) }

  context "creating a new ClientLocation" do
    
    it "creates a ClientLocation object" do
      expect(client_location).to be_an_instance_of ClientLocation
    end

    it "has a user association" do
      expect(client_location.client).to eq(mom)
    end

    it "has a location association" do
      expect(client_location.location).to eq(iceArena)
    end

  end
end
