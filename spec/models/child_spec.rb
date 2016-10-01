require 'rails_helper'

RSpec.describe Child, type: :model do
  
  let(:kid) { create(:child) }

  context "creating a new child" do
    it "creates a Child object" do
      expect(kid).to be_an_instance_of Child
    end

    it "has a first name" do
      expect(kid.first_name).to eq("Baby")
    end

    it "has a last name" do
      expect(kid.last_name).to eq("Ruth")
    end
    
    it "has an age" do
      expect(kid.age).to eq(9)
    end
  end

  context "validates associations" do
    it "belongs to a parent" do
      should belong_to(:parent)
    end

    it "has many appointments" do
      should have_many(:appointments)
    end
  end

  context "validates data" do
    it "validates a parent is present" do
      should validate_presence_of(:parent)
    end
  end
end
