require 'rails_helper'

RSpec.describe Notification, type: :model do
 
  let(:notification) { create(:notification) }

   context "creating a new notification" do
    it "creates an Notification object" do
      expect(notification).to be_an_instance_of Notification
    end
    
    it "has text content" do
      expect(notification.content).to eq("Lesson Canceled")
    end
  end

  context "validates associations" do
    it "belongs to a appointment" do
      should belong_to(:appointment)
    end

    it "has many messages" do
      should have_many(:messages)
    end

    it "has many notification_receivers" do
      should have_many(:notification_receivers)
    end

    it "has many receivers" do
      should have_many(:receivers)
    end
  end

  context "validates data" do
    it "validates an appointment is present" do
      should validate_presence_of(:appointment)
    end

    it "validates conent present" do
      should validate_presence_of(:content)
    end 
  end   
end
