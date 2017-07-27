require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@bloccit.com", password: "password") }

     #tests for name
     it { is_expected.to validate_presence_of(:name) }
     it { is_expected.to validate_length_of(:name).is_at_least(1) }

     it { is_expected.to have_many(:items) }

  describe "invalid user" do
    let(:user_with_invalid_email) { User.new(email: "", password: 'password') }

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

  describe "duplicate email" do
    before do
      user
    end

    let(:duplicate_user) { User.new(email: "user@bloccit.com", password: "password")}
    it "should be an invalid due to duplciate email" do
      expect(duplicate_user).to_not be_valid
    end
  end

  describe "after create" do
    before do
      @new_user = User.new(email: 'newuser@example.com', password: 'helloworld')
    end

    it "sends an email register" do
      expect(WelcomeMailer).to receive(:welcome_send).with(@new_user).and_return(double(deliver_now: true))
      @new_user.save!
    end

    it "does not send emails to user who isn't registered" do
      expect(WelcomeMailer).not_to receive(:welcome_send).with(@new_user)
    end
  end
end
