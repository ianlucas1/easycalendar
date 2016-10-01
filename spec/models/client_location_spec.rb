require 'rails_helper'

RSpec.describe ClientLocation, type: :model do

  let(:client_location) { create(:client_location) }

  context "creating a new ClientLocation" do
    it "creates a ClientLocation object" do
      expect(client_location).to be_an_instance_of ClientLocation
    end
  end

  context "validates associations" do
    it "belongs to a client" do
      should belong_to(:client)
    end

    it "belongs to a location" do
      should belong_to(:location)
    end
  end

  context "validates data" do
    it "validates a client is present" do
      should validate_presence_of(:client)
    end

    it "validates a location is present" do
      should validate_presence_of(:location)
    end
  end
end
