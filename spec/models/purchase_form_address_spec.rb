require 'rails_helper'

RSpec.describe PurchaseFormAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @user2 = FactoryBot.create(:user)
    @purchase_form_address = FactoryBot.build(:purchase_form_address, user_id: @user2.id, item_id: @item.id)
  end

  context '商品購入の保存ができる時' do
    it "postal_code・ship_area_id・city・street_number・phone_number・token・user_id・item_idがあれば保存できること" do
      expect(@purchase_form_address).to be_valid
    end
    it "building_nameが空でも保存できる" do
      @purchase_form_address.building_name = nil
      expect(@purchase_form_address).to be_valid
    end
  end

  context '商品購入の保存ができない時' do
    it "postal_codeが空だと保存できない" do
      @purchase_form_address.postal_code = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Postal code can't be blank", "Postal code 『-』を使い正しく入力してください")
    end
    it "postal_codeに『-』がないと保存できない" do
      @purchase_form_address.postal_code = "1234567"
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Postal code 『-』を使い正しく入力してください")
    end
    it "ship_area_idが1だと保存できない" do
      @purchase_form_address.ship_area_id = 1
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Ship area must be other than 1")
    end
    it "cityが空だと保存できない" do
      @purchase_form_address.city = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("City can't be blank")
    end
    it "street_numberが空だと保存できない" do
      @purchase_form_address.street_number = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Street number can't be blank")
    end
    it "phone_numberが空だと保存できない" do
      @purchase_form_address.phone_number = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Phone number can't be blank",
        "Phone number is not a number",
        "Phone number は半角数字で11桁以内で入力してください。")
    end
    it "phone_numberに『-』があると保存できない" do
      @purchase_form_address.phone_number =  "18-18-18"
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Phone number は半角数字で11桁以内で入力してください。")
    end
    it "tokenが空だと保存できない" do
      @purchase_form_address.token = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空だと保存できない" do
      @purchase_form_address.user_id = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと保存できない" do
      @purchase_form_address.item_id = nil
      @purchase_form_address.valid?
      expect(@purchase_form_address.errors.full_messages).to include("Item can't be blank")
    end
  end

end
