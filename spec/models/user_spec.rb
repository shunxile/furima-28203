require 'rails_helper'
 RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できること" do
      expect(@user).to be_valid
    end
  
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "aaaaa"
      @user.password_confirmation = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name は全角で入力してください。")
    end
    it "last_nameが全角でないと登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name は全角で入力してください。")
    end
    it "first_nameが全角でないと登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana は全角カタカナで入力して下さい。")
    end
    it "last_name_kanaが全角カタカナでないと登録できない" do
      @user.last_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana は全角カタカナで入力して下さい。")
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end
  end
 end
