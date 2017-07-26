class ItemsController < ApplicationController
  def create
    @items = current_user.items.build(params[:name])
    @items.name = params[:items][:name]

    if @items.save
      flash[:notice] = "Item saved"
      redirect_to root_path
    else
      flash[:alert] = "Oops, please try again"
      redirect_to root_path
    end
  end

  def destroy
    @items = Item.find(params[:id])
    @items.destroy
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
