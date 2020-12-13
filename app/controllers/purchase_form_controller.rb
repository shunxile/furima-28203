class PurchaseFormController < ApplicationController
  def index
    @item = item_find
    @purchase_form = PurchaseForm.new
  end

  def create
    
    @purchase_form = PurchaseForm.new(purchase_form_params)
    binding.pry
    if @purchase_form.valid?
      @purchase_form.save
      return redirect_to root_path
    else
      @item = item_find
      render :index
    end
  end

  private
  
  def purchase_form_params
    params.permit(:postal_code, :ship_area_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_find
    Item.find(params[:item_id])
  end

end


