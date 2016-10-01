require 'rails_helper'

RSpec.describe Invite, type: :model do
  
  let(:invite) { create(:invite) }

  context "creating a new invite" do
    it "creates an Invite object" do
      expect(invite).to be_an_instance_of Invite
    end
  end

  context "validates associations" do
    it "belongs to a client" do
      should belong_to(:client)
    end

    it "belongs to a coach_activity" do
      should belong_to(:coach_activity)
    end

    it "has a coach" do
      should have_one(:coach)
    end  

    it "has an activity" do
      should have_one(:activity)
    end  
  end

  context "validates data" do
    it "validates a client is present" do
      should validate_presence_of(:client)
    end

    it "validates a coach_activity is present" do
      should validate_presence_of(:coach_activity)
    end
  end  
end
