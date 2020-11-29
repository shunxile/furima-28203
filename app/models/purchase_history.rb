class PurchaseHistory < ApplicationRecord
  def index
    @item = item.all
  end
end