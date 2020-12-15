class PurchaseFormAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_area_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: '『-』を使い正しく入力してください' }
    validates :city
    validates :street_number
    validates :phone_number, numericality: { only_integer: true }, format: { with: /\A[0-9]{1,11}\z/, message: "は半角数字で11桁以内で入力してください。"}
    validates :token
    validates :user_id
    validates :item_id
  end

    validates :ship_area_id, presence: true, numericality: { other_than: 1 }
  def save
    purchase_form = PurchaseForm.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, ship_area_id: ship_area_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_form_id: purchase_form.id)
  end
end