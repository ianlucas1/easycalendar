require 'rails_helper'

RSpec.describe User, type: :model do

  context "creating a new user" do
  
    user = User.new(email: "abc@abc.com", password:"123")
  
    it "has a email" do
      expect(user.email).to eq("abc@abc.com")
    end
  
    it "has a password" do
      expect(user.password).to eq("123")
    end

  end
end
