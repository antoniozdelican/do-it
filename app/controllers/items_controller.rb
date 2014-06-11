class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @item = @category.items.build(status_id: Status.find(:pending).id)
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.build(item_params)
    if @item.save
      flash[:success] = "You have a new item!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "You have just updated an item!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "You have just deleted an item!"
    redirect_to root_path
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :deadline, :status_id)
    end
end