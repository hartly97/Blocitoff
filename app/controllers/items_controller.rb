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

<<<<<<< HEAD

=======
  def destroy
    @items = Item.find(params[:id])
    if @items.destroy
    flash[:notice] = "Item has been deleted!"
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
>>>>>>> Jose


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
