require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:user) {User.create!(name: "user name", email:"user@example.com", password: "helloworld", password_confirmation: "helloworld", confirmed_at: Time.now)}

before :each do
  sign_in user
end
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
