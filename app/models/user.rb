class User < ApplicationRecord
  
    has_many :items
    has_many :purchase_histories

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
