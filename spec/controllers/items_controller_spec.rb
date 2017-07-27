require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before(:each) do
    sign_in user
  end

  describe "POST create" do
    it "increases the number of Item by 1" do
      post :create, user_id: user.id, item: {name: ""}
      expect(user.items.count).to eq(1)
    end

    it "redirect to root_path" do
      post :create, user_id: user.id, item: {name: ""}
      expect(response).to redirect_to root_path
    end

    it "assigns the new item to @item" do
      post :create, user_id: user.id, item: {name: ""}
      expect(assigns(:item)).to eq Item.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, user_id: user.id, id: item.id
      expect(user.items.count).to eq(0)
    end

    it "redirects to root_path" do
      delete :destroy, user_id: user.id, id: item.id
      expect(response).to redirect_to root_path
    end
  end

  describe "GET toggle" do
    #it "" do

    #enditem = Item.find(params[:item_id])
  #item.completed = !item.completed
  #item.save
end
  #it "redirects to current_user" do
  #expect(response).to redirect_to current_user
end
end
