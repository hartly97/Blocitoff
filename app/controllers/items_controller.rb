class ItemsController < ApplicationController


  def index
    @items = Item.all#visible_to(current_user)
  end

  def show
    @item = Item.new
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)#(user: current_user)
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
end
