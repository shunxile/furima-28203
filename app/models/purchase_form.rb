class PurchaseForm < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

    include ActiveModel::Model
    attr_accessor :postal_code, :ship_area_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id
  
    with_options presence: true do
      validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: 'を入力してください' }
      validates :city
      validates :street_number
      validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'を入力してください' }
    end
  
     validates :ship_area_id, numericality: { other_than: 0, message: "can't be blank" }
  
     def save
      Address.create(postal_code: postal_code, ship_area_id: ship_area.id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number)
      PurchaseForm.create(user_id: user.id, item_id: item.id)
     end
end
