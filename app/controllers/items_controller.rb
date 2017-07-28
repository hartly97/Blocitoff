class ItemsController < ApplicationController
  def create
    @item = current_user.items.build(params[:name])
    @item.name = params[:items][:name]

    if @item.save
      flash[:notice] = "Item saved"
      redirect_to root_path
    else
      flash[:alert] = "Oops, please try again"
      redirect_to root_path
    end
  end


  def destroy
    #@item = Item.find(params[:id])
    if @item.destroy
    flash[:notice] = "\"#{@item.name}\"Item has been deleted!"
  else
    flash[:alert] = "There was an error completing the item. Try again."
    redirect_to current_user
    end
  end

  def toggle
    item = Item.find(params[:item_id])
    item.completed = !item.completed
    item.save
    redirect_to current_user
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
