require 'rails_helper'

RSpec.describe NotificationReceiver, type: :model do
 
  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:lesson) { Appointment.create!(coach_activity_id: michelle_kwan_figure_skating.id, child_id: kid.id, location_id: iceArena.id) }
  let(:notification) { Notification.create!(appointment_id: lesson.id, content: "Lesson Canceled") }
  let(:notification_receiver) { NotificationReceiver.create!(receiver_id: mom.id, notification_id: notification.id) }

  context "creating a new NotificationReceiver" do
    
    it "creates a NotificationReceiver object" do
      expect(notification_receiver).to be_an_instance_of NotificationReceiver
    end

    it "has a receiver association" do
      expect(notification_receiver.receiver).to eq(mom)
    end

    it "has a notification association" do
      expect(notification_receiver.notification).to eq(notification)
    end

  end
end
