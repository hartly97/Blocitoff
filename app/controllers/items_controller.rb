class ItemsController < ApplicationController

  #before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    console
    @item = Item.new
  end
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
    @items = Item.find(params[:id])
    @items.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Item Deleted" }
      format.js {flash.now[:notice] = "Item Deleted"}
    end
end
  private

  def item_params
    params.require(:item).permit(:name)
  end
