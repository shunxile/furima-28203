class Item < ApplicationRecord
  has_one :purchase_form
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :ship_area
  belongs_to :ship_day

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :value, numericality: { less_than: 9999999, greater_than: 299 }, format: { with: /\A[0-9]+\z/, message: "は半角数字で300~9,999,999で入力してください。"}
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :state_id
    validates :shipping_charge_id
    validates :ship_area_id
    validates :ship_day_id
    validates :category_id
  end
end
