require 'rails_helper'

RSpec.describe Child, type: :model do
  
  let(:mom) { User.create!(first_name: "Martha", last_name: "Ruth") }
  let(:kid) { Child.create!(first_name: "Baby", last_name: "Ruth", age: 9, client_id: mom.id) }

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

    it "should have a client (user) association" do
      expect(kid.client).to eq(mom) 
    end

  end
end
