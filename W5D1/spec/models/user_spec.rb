require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user, email_address: "archanakannan1986@gmail.com",password: "password")
  end

  describe 'validations' do
    it {should validate_presence_of (:email_address)}
    it {should validate_presence_of (:password_digest)}
    it {should validate_length_of(:password).is_atleast(6)}
  end

  describe "#is_password?" do
    it "verifies correct password" do
      expect(user.is_password?("password")).to be true
    end

    it "verifies incorrect password" do
      expect(user.is_password?("something")).to be false
    end

    describe "#reset_session_token" do
      it "reassigns a session_token to the user" do
        previous = user.session_token
        user.reset_session_token
        expect(user.session_token).to_no eq(previous)
      end
      it "returns new session token" do
        expect(user.reset_session_token).to_eq(user.session_token)
      end
    end

    describe "User::find_by_credentials" do
      it "returns user when correct credentials given" do
        expect(User.find_by_credentials("archanakannan1986.gmail.com","password")).to eq(user)
      end

      it "returns nil when user doesnt exist" do
        expect(User.find_by_credentials("something@gmail.com"),"something")).to eq(nil)
      end
    end
end
