class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "items/new"
    else
      render :new
    end

    private

    def item_params
      params.require(:item).permit(:image, :name, :content, :value, :state_id, :shipping_charge_id, :shio_area_id, :ship_day_id, :category_id).merge(user_id: current_user.id)
      
    end
  end
end
