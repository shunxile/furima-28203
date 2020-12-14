FactoryBot.define do
  factory :purchase_form do
    
    association :user
    association :item
  end
end
