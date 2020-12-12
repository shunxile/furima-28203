require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "priceがあれば保存できる" do
    binding.pry
    expect(@order).to be_balid
  end
  it "priceが空では保存できない" do
    @order.price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end
end
