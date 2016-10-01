require 'rails_helper'

RSpec.describe CoachActivity, type: :model do
  
  let(:coach_activity) { create(:coach_activity) }

  context "creating a new CoachActivity" do
    it "creates a CoachActivity object" do
      expect(coach_activity).to be_an_instance_of CoachActivity
    end
  end

  context "validates associations" do
    it "belongs to a coach" do
      should belong_to(:coach)
    end

    it "belongs to a activity" do
      should belong_to(:activity)
    end
  end

  context "validates data" do
    it "validates a coach is present" do
      should validate_presence_of(:coach)
    end

    it "validates a activity is present" do
      should validate_presence_of(:activity)
    end
  end
end
