class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id,
                                 :shopping_charge_id,:shopping_area_id, :days_to_shop_id, :image).merge(user_id: current_user.id)
  end

end
