require 'rails_helper'

RSpec.describe NotificationReceiver, type: :model do
 
  let(:notification_receiver) { create(:notification_receiver) }

  context "creating a new NotificationReceiver" do
    it "creates a NotificationReceiver object" do
      expect(notification_receiver).to be_an_instance_of NotificationReceiver
    end
  end

  context "validates associations" do
    it "belongs to a receiver" do
      should belong_to(:receiver)
    end

    it "belongs to a notification" do
      should belong_to(:notification)
    end
  end

  context "validates data" do
    it "validates a notification is present" do
      should validate_presence_of(:notification)
    end

    it "validates a receiver is present" do
      should validate_presence_of(:receiver)
    end 
  end  
end
