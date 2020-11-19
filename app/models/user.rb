class User < ApplicationRecord
  has_many :items
  has_many :purchase_histories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :email, format: { with: /\A[.+@.+]+\z/, messages: "は＠を含んで下さい。"}
    validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]{6, }+\z/, message: "は半角英数で6文字以上入力してください。"}
  end
end
