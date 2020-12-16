FactoryBot.define do
  factory :purchase_form_address do
    postal_code {Faker::Number.between(from: 1000000, to: 9999999).to_s.insert(3, "-")}
    ship_area_id {Faker::Number.between(from: 2, to: 48)}
    city {Gimei.city.kanji}
    street_number {Gimei.town.kanji + "7777"}
    building_name {Gimei.town.kanji + "ビル" + Faker::Address.building_number}
    phone_number {Faker::Number.between(from: 0, to: 99999999999)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end