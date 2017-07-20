class UsersController < ApplicationController

  def index
    @user = User
  end


  def show
    @user = current_user
    @items = current_user.items
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Blocitoff #{@user.name}!"
      create_session(@user)
      redirect_to root_url
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end
end
