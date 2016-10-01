require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:coach) { build(:coach) }
  let(:client) { build(:client) }

  context "creating a new user" do
    it "is an instance of User" do
      expect(coach).to be_an_instance_of User
      expect(client).to be_an_instance_of User
    end
  
    it "has a first name" do
      expect(coach.first_name).to eq("Michelle")
    end

    it "has a last name" do
      expect(coach.last_name).to eq("Kwan")
    end
  end

  context "validates associations" do
    it "has many children" do
      should have_many(:children)
    end

    it "has many appointments" do
      should have_many(:appointments)
    end

    it "has many coach_activities" do
      should have_many(:coach_activities)
    end

    it "has many activities" do
      should have_many(:activities)
    end

    it "has many client_locations" do
      should have_many(:client_locations)
    end

    it "has many coach_locations" do
      should have_many(:coach_locations)
    end

    it "has many coaches" do
      should have_many(:coaches)
    end

    it "has many clients" do
      should have_many(:clients)
    end

    it "has many clients_children" do
      should have_many(:clients_children)
    end
    
    it "has many notification_receivers" do
      should have_many(:notification_receivers)
    end

    it "has many notifications_received" do
      should have_many(:notifications_received)
    end

    it "has many notifications_sent" do
      should have_many(:notifications_sent)
    end

    it "has many messages_received" do
      should have_many(:messages_received)
    end

    #  it "has many messages_sent" do
    #   should have_many(:messages_sent)
    # end                    
  end
end
