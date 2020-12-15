FactoryBot.define do
  factory :purchase_form do
    
    association :user, optional: true
    association :item, optional: true
  end
end
