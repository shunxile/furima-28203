require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end
end
