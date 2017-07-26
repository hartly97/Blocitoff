class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || current_user.id)
    @user.items = current_user.items
  end
end
