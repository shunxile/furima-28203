require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  context '出品商品の保存ができる時' do
    it "image・name・content・value・state_id・shipping_charge_id・ship_area_id・ship_day_id・category_id・userがあれば保存できること" do
      expect(@item).to be_valid
    end
  end

  context '出品商品の保存ができない時' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "nameが40文字以上だと登録できない" do
      @item.name = "a" * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
    it "contentが空だと登録できない" do
      @item.content = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end
    it "contentが1000文字以上だと登録できない" do
      @item.content = "a" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")
    end
    it "category_idが1だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "state_idが1だと登録できない" do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it "shipping_charge_idが1だと登録できない" do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it "ship_area_idが1だと登録できない" do
      @item.ship_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship area must be other than 1")
    end
    it "ship_day_idが1だと登録できない" do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day must be other than 1")
    end
    it "valueが空だと登録できない" do
      @item.value = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Value can't be blank")
    end
    it "valueが299以下だと登録できない" do
      @item.value = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be greater than 299")
    end
    it "valueが10,000,000以上だと登録できない" do
      @item.value = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be less than 9999999")
    end
  it "valueが半角数字じゃないと登録できない" do
      @item.value = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not a number")
    end
  end
end
