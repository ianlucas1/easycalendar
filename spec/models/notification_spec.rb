require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:lesson) { Appointment.create!(coach_activity_id: michelle_kwan_figure_skating.id, child_id: kid.id, location_id: iceArena.id) }
  let(:notification) { Notification.create!(appointment_id: lesson.id, content: "Lesson Canceled") }

   context "creating a new notification" do
    
    it "creates an Notification object" do
      expect(notification).to be_an_instance_of Notification
    end

    it "has an associated appointment" do
      expect(notification.appointment).to eq(lesson)
    end
    
    it "has content" do
      expect(notification.content).to eq("Lesson Canceled")
    end

    # it "has an associated message" do
    #   expect(notification.message).to eq()
    # end   

  end
end
