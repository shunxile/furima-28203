class OrdersController < ApplicationController
  def index
    @item = item_find
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  private
  def item_params
    params.require(:item).permit(:image, :name, :content, :value, :state_id, :shipping_charge_id, :ship_area_id, :ship_day_id, :category_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
