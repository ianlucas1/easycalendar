require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }

  context "creating a new activity" do
    
    it "creates an Activity object" do
      expect(figure_skating).to be_an_instance_of Activity
    end

    # NEED TO MAKE THIS PASS
    # it "should have a coach (user) association" do
    #   expect(figure_skating.coaches).to eq(michelle_kwan) 
    # end

  end
end
