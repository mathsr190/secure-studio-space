require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it 'email,団体名、団体名(かな)、団体代表者(姓)、団体代表者(名)、団体代表者(姓)(かな)、団体代表者(名)(かな)、団体代表者誕生日、電話番号、団体所属住所郵便番号、都道府県、市区町村、それ以降の住所、建物名、passwordが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it '建物名が空でも登録できる' do
        @user.building = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが@を含まないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ぱすわーどてすと'
        @user.password_confirmation = 'ぱすわーどてすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '団体名が空だと登録できない' do
        @user.group_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Group name can't be blank")
      end
      it '団体名(かな)が空だと登録できない' do
        @user.group_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Group name kana can't be blank")
      end
      it '団体名(かな)が半角英数字では登録できない' do
        @user.group_name_kana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Group name kana is invalid")
      end
      it '団体名(かな)がカタカナでは登録できない' do
        @user.group_name_kana = Gimei.name.last.katakana
        @user.valid?
        expect(@user.errors.full_messages).to include("Group name kana is invalid")
      end
      it '団体代表者(姓)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '団体代表者(姓)が半角英数字では登録できない' do
        @user.last_name = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '団体代表者(名)が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '団体代表者(名)が半角英数字では登録できない' do
        @user.first_name = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '団体代表者(姓)(かな)が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '団体代表者(姓)(かな)が半角英数字では登録できない' do
        @user.last_name_kana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '団体代表者(姓)(かな)がカタカナでは登録できない' do
        @user.last_name_kana = Gimei.name.last.katakana
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '団体代表者(名)(かな)が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '団体代表者(名)(かな)が半角英数字では登録できない' do
        @user.first_name_kana = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '団体代表者(名)(かな)がカタカナでは登録できない' do
        @user.first_name_kana = Gimei.name.first.katakana
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '団体代表者誕生日が空だと登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it '電話番号が空では保存できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが入っていると保存できない' do
        @user.phone_number = '090-1234-5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下では保存できない' do
        @user.phone_number = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では保存できない' do
        @user.phone_number = '123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number is invalid")
      end
      it '郵便番号が空では保存できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン(-)がないと保存できない' do
        @user.postal_code = Faker::Number.number(digits: 7)
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字だと保存できない' do
        @user.postal_code = '１２３-４５６７'
        @user.valid?
        expect(@user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていない(0)と保存できない' do
        @user.prefecture_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では保存できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村以降の住所が空では保存できない' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end
    end
  end
end