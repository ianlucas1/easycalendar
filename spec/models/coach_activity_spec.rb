require 'rails_helper'

RSpec.describe CoachActivity, type: :model do
  
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:coach_activity) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }

  context "creating a new CoachActivity" do
    
    it "creates a CoachActivity object" do
      expect(coach_activity).to be_an_instance_of CoachActivity
    end

    it "has a coach association" do
      expect(coach_activity.coach).to eq(michelle_kwan)
    end

    it "has an activity association" do
      expect(coach_activity.activity).to eq(figure_skating)
    end

  end
end
