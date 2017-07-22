class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show
    @user = current_user
    #@items = current_user.items
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      flash[:notice] = "Welcome to Blocitoff #{@user.name}!"
      create_session(@user)
      redirect_to root_url
     edirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
