require 'rails_helper'

RSpec.describe CoachLocation, type: :model do
  
  let(:coach_location) { create(:coach_location) }

  context "creating a new CoachLocation" do
    it "creates a CoachLocation object" do
      expect(coach_location).to be_an_instance_of CoachLocation
    end
  end

  context "validates associations" do
    it "belongs to a coach" do
      should belong_to(:coach)
    end

    it "belongs to a location" do
      should belong_to(:location)
    end
  end

  context "validates data" do
    it "validates a coach is present" do
      should validate_presence_of(:coach)
    end

    it "validates a location is present" do
      should validate_presence_of(:location)
    end
  end
end
