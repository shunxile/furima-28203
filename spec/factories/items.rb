FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    content {Faker::Lorem.sentence}
    value {Faker::Commerce.price(range: 300..9999999)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id {Faker::Number.between(from: 2, to: 3)}
    ship_area_id {Faker::Number.between(from: 2, to: 48)}
    ship_day_id {Faker::Number.between(from: 2, to: 4)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    association :user
  end
end