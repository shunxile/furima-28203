class Address < ApplicationRecord
  belongs_to :purchase_form
  belongs_to :item
  

  
end
