class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_check, only:[:new, :show, :edit, :update, :destroy]

  def new
  	@item = Item.new
  end

  def index
  	@items = Item.all
  end

  def create
  	item = Item.new(item_params)
  	if item.save
      flash[:notice] = "商品を掲載いたしました。"
    end
  	redirect_to item_path(item.id)
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	item = Item.find(params[:id])
  	if item.update(item_params)
      flash[:notice] = "商品を更新しました。"
    end
  	redirect_to items_path
  end

  def destroy
  	item = Item.find(params[:id])
  	if item.destroy
      flash[:notice] = "商品を削除いたしました。"
  	redirect_to items_path
    end
  end

  def admin_check
  	if current_user.admin == false
  		redirect_to items_path
  	end
  end

  private

  def item_params
  	params.require(:item).permit(:name, :caption, :image)
  end

end
