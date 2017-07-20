class ItemsController < ApplicationController

  before_action :authenticate_user!

  def index
    @item = Item.visible_to(current_user)
  end

  def show
    @item = Item.new
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(user: current_user)
    @item.assign_attributes(item_params)

    if @item.save
      flash[:notice] = "items was saved."
      redirect_to current_user
    else
      flash.now[:alert] = "There was an error saving the items. Please try again."
      redirect_to current_user
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete

    if @item.destroy
      flash[:notice] = "Item has been deleted!"
    else
      flash[:alert] = "There was an error completing the item. Try again."
    redirect_to current_user
  end
end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
