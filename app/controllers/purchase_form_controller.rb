class PurchaseFormController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  def index
    @purchase_form_address = PurchaseFormAddress.new
    if current_user.id == @item.user.id || @item.purchase_form != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_form_address = PurchaseFormAddress.new(purchase_form_address_params)
    if @purchase_form_address.valid?
      pay
      @purchase_form_address.save
      return redirect_to root_path
    else
      @item = item_find
      render :index
    end
  end

  private
  
  def purchase_form_address_params
    params.require(:purchase_form_address).permit(:postal_code, :ship_area_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.value,
        card: purchase_form_address_params[:token],
        currency: 'jpy'
      )
    end
end


