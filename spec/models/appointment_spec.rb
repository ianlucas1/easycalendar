require 'rails_helper'

RSpec.describe Appointment, type: :model do
  
  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:lesson) { Appointment.create!(coach_activity_id: michelle_kwan_figure_skating.id, child_id: kid.id, location_id: iceArena.id) }

  context "creating a new Appointment" do
    
    it "creates an Appointment object" do
      expect(lesson).to be_an_instance_of Appointment
    end

    it "has a child association" do
      expect(lesson.child).to eq(kid)
    end

    it "has a location association" do
      expect(lesson.location).to eq(iceArena)
    end

    it "has a client association" do
      expect(lesson.child.client).to eq(mom)
    end

  end
end