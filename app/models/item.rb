class Item < ApplicationRecord
  has_one :purchase_history
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :content
    validates :value
    validates :state_id
    validates :shipping_charge_id
    validates :ship_area_id
    validates :ship_day_id
    validates :category_id
  end
end
