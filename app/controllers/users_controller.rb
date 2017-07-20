class UsersController < ApplicationController

  def show
    #@user = current_user
    @user = User.find(params[:id] || current_user.id)
    @items = @user.items
  end
end
