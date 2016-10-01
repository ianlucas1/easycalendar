require 'rails_helper'

RSpec.describe Invite, type: :model do
  
  let(:dad) { User.create!(first_name: "Mark", last_name: "Ruth") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:invite) { Invite.create!(client_id: dad.id, coach_activity_id: michelle_kwan_figure_skating.id) }

  context "creating a new invite" do
    
    it "creates an Invite object" do
      expect(invite).to be_an_instance_of Invite
    end

    it "has an associated client" do
      expect(invite.client).to eq(dad)
    end
    
    it "has an associated coach_activity" do
      expect(invite.coach_activity).to eq(michelle_kwan_figure_skating)
    end

    it "has an associated coach" do
      expect(invite.coach).to eq(michelle_kwan)
    end   

    it "has an associated activity" do
      expect(invite.activity).to eq(figure_skating)
    end 

  end
end
