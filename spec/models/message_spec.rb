require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:message) { create(:message) }

   context "creating a new Message" do
    it "creates a Message object" do
      expect(message).to be_an_instance_of Message
    end

    it "has content" do
      expect(message.content).to eq("Y")
    end
  end

  context "validates associations" do
    it "belongs to a notification" do
      should belong_to(:notification)
    end

    it "belongs to a sender" do
      should belong_to(:sender)
    end

    it "belongs to a receiver" do
      should belong_to(:receiver)
    end

    it "has an appointment" do
      should have_one(:appointment)
    end
  end

  context "validates data" do
    it "validates a notification is present" do
      should validate_presence_of(:notification)
    end

    it "validates a sender is present" do
      should validate_presence_of(:sender)
    end

    it "validates a receiver is present" do
      should validate_presence_of(:receiver)
    end

    it "validates content is present" do
      should validate_presence_of(:content)
    end  
  end
end
