require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  let(:activity) { create(:activity) }
  # let(:coach_activity) { create(:coach_activity, activity: :activity)}
  
  context "creating a new activity" do
    it "creates an Activity object" do
      expect(activity).to be_an_instance_of Activity
    end
  end

  context "validates associations" do
    it "has many coach_activities" do
      should have_many(:coach_activities)
    end

    it "has many coaches" do
      should have_many(:coaches)
    end
  end

  context "validates data" do
    it "validates a name is present" do
      should validate_presence_of(:name)
    end

    it "validates a name is present" do 
      should validate_uniqueness_of(:name)
    end
  end
end
