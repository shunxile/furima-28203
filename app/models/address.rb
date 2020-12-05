class Address < ApplicationRecord
  belongs_to :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state

  with_options presence: true do
   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
   validates :state_id
   validates :city
   validates :street_number
   validates :phone_number, precision: 11
  end
end
