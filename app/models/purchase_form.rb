class AddressPurchase

  include ActiveModel::Model
  attr_accessor :podtal_code, :ship_area_id, :city, :bstreet_number, :building_name, :phone_number

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_area

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: 'を入力してください' }
    validates :city
    validates :street_number
    validates :phone_number, precision: 11
    validates :user_id
    varidates :item_id
   end

   validates :ship_area_id, numericality: { other_than: 0, message: "can't be blank" }

   def save
    Address.create(postal_code: postal_code, ship_area_id: state_area.id, city: city,street_number: street_number, phone_number: phone_number, user_id: user.id)
    PurchaseHistory.create(user_id: user.id, item_id: item.id)
   end
end