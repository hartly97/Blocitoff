class UsersController < ApplicationController

  def index
    @users = User
  end


  def show
    @user = current_user
  
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]


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
