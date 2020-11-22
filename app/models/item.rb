class Item < ApplicationRecord
  has_one :purchase_history
  belongs_to :user
  has_one_attached :image
  #extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :state_id
  belongs_to :shipping_charge_id
  belongs_to :ship_area_id
  belongs_to :ship_day_id

  with_options presence: true do
    validates :name
    validates :content
    validates :value
    validates :state_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :ship_area_id, numericality: { other_than: 1 }
    validates :ship_day_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
  end
end
