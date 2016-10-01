require 'rails_helper'

RSpec.describe CoachLocation, type: :model do
  
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:coach_location) { CoachLocation.create!(coach_id: michelle_kwan.id, location_id: iceArena.id) }

  context "creating a new CoachLocation" do
    
    it "creates a CoachLocation object" do
      expect(coach_location).to be_an_instance_of CoachLocation
    end

    it "has a user association" do
      expect(coach_location.coach).to eq(michelle_kwan)
    end

    it "has a location association" do
      expect(coach_location.location).to eq(iceArena)
    end

  end
end
