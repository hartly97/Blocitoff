class ItemsController < ApplicationController
  def create
    #@user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = @user

    if @item.save
      redirect_to @user, notice: "Item was saved successfully."
    else
      flash.now[alert] = "error creating item. Please try again."
      render :save #create
  end
end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
