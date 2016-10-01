require 'rails_helper'

RSpec.describe Appointment, type: :model do
  
  let(:appointment) { create(:appointment) }

  context "creating a new Appointment" do
    it "creates an Appointment object" do
      expect(appointment).to be_an_instance_of Appointment
    end
  end

  context "validates associations" do
    it "belongs to a child" do
      should belong_to(:child)
    end

    it "belongs to a location" do
      should belong_to(:location)
    end

    it "has a client" do
      should have_one(:client)
    end

    it "belongs to a coach_activity" do
      should belong_to(:coach_activity)
    end

    it "has a coach" do
      should have_one(:coach)
    end

    it "has many notifications" do
      should have_many(:notifications)
    end
  end

  context "validates data" do
    it "validates a location is present" do
      should validate_presence_of(:location)
    end

    it "validates a coach_activity is present" do
      should validate_presence_of(:coach_activity)
    end

    it "validates a coach is present" do
      should validate_presence_of(:coach)
    end
  end
end