require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:dad) { User.create!(first_name: "Marky", last_name: "Mark") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }
  let(:iceArena) { Location.create!(name: "IceBox", address: "123 Way St.") }
  let(:figure_skating) { Activity.create!(name: "Figure Skating") }
  let(:michelle_kwan) { User.create!(first_name: "Michelle", last_name: "Kwan") }
  let(:michelle_kwan_figure_skating) { CoachActivity.create!(coach_id: michelle_kwan.id, activity_id: figure_skating.id) }
  let(:lesson) { Appointment.create!(coach_activity_id: michelle_kwan_figure_skating.id, child_id: kid.id, location_id: iceArena.id) }
  let(:notification) { Notification.create!(appointment_id: lesson.id, content: "Lesson Canceled") }
  let(:message) { Message.create!(notification_id: notification.id, sender_id: dad.id, receiver_id: michelle_kwan.id, content: "Y") }

   context "creating a new Message" do
    
    it "creates an Message object" do
      expect(message).to be_an_instance_of Message
    end

    it "has an associated notification" do
      expect(message.notification).to eq(notification)
    end
    
    it "has an associated sender" do
      expect(message.sender).to eq(dad)
    end

    it "has an associated receiver" do
      expect(message.receiver).to eq(michelle_kwan)
    end

    it "has an associated appointment" do
      expect(message.appointment).to eq(lesson)
    end

    it "has content" do
      expect(message.content).to eq("Y")
    end

  end
end
