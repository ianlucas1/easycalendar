require 'rails_helper'

RSpec.describe Location, type: :model do

  let(:location) { create(:location) }

  context "creating a new Location" do
    it "creates a Location object" do
      expect(location).to be_an_instance_of Location
    end

    it "has a name" do
      expect(location.name).to eq("IceBox")
    end

    it "has an address" do
      expect(location.address).to eq("123 Way St.")
    end
  end

  context "validates associations" do
    it "has many appointments" do
      should have_many(:appointments)
    end

    it "has many client_locations" do
      should have_many(:client_locations)
    end 
  end

  context "validates data" do
    it "validates a name is present" do
      should validate_presence_of(:name)
    end

    it "validates a name is unique" do
      should validate_uniqueness_of(:name)
    end

    it "validates a address is present" do
      should validate_presence_of(:address)
    end

    it "validates a address is unique" do
      should validate_uniqueness_of(:address)
    end   
  end
end
