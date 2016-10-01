require 'rails_helper'

RSpec.describe Location, type: :model do

  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:lesson) { Appointment.create!(coach_activity_id: michelle_kwan_figure_skating.id, child_id: kid.id, location_id: iceArena.id) }

  context "creating a new Location" do
    
    it "creates a Location object" do
      expect(iceArena).to be_an_instance_of Location
    end

    it "has a name" do
      expect(iceArena.name).to eq("IceBox")
    end

    it "has an address" do
      expect(iceArena.address).to eq("123 Way St.")
    end

    it "has an appointment association" do
      expect(iceArena.appointments).to include(lesson)
    end
    
  end
end
