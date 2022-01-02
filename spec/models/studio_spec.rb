require 'rails_helper'

RSpec.describe Studio, type: :model do
  before do
    #array = ["1","2","3","4","5","6","7"].sample(rand(1..7))
    @studio = FactoryBot.build(:studio)
    #, bday_ids: array 
  end

  describe 'スタジオ登録' do
    context 'スタジオ登録できる場合' do
      it '全項目(自己紹介、郵便番号、都道府県、市区町村、それ以降の住所、アクセス、営業開始時間、営業終了時間、電話番号)、manager紐付けがあれば保存できる' do
        expect(@studio).to be_valid
      end
    end

    context 'スタジオ登録できない場合' do
      it 'imageが空では保存できない' do
        @studio.image = nil
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Image can't be blank")
      end
      it '紹介文が空では保存できない' do
        @studio.introduction = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Introduction can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @studio.postal_code = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン(-)がないと保存できない' do
        @studio.postal_code = Faker::Number.number(digits: 7)
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字だと保存できない' do
        @studio.postal_code = '１２３-４５６７'
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていない(0)と保存できない' do
        @studio.prefecture_id = 0
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では保存できない' do
        @studio.city = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村以降の住所が空では保存できない' do
        @studio.address = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Address can't be blank")
      end
      it 'アクセスが空では保存できない' do
        @studio.access = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Access can't be blank")
      end
      it '営業開始時間が空では保存できない' do
        @studio.business_hours_start = nil
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Business hours start can't be blank")
      end
      it '営業終了時間が空では保存できない' do
        @studio.business_hours_end = nil
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Business hours end can't be blank")
      end
      it '電話番号が空では保存できない' do
        @studio.phone_number = ''
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが入っていると保存できない' do
        @studio.phone_number = '090-1234-5678'
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下では保存できない' do
        @studio.phone_number = '123456789'
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では保存できない' do
        @studio.phone_number = '123456789012'
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Phone number is invalid")
      end
      it 'manager_idが空だと保存できない' do
        @studio.manager = nil
        @studio.valid?
        expect(@studio.errors.full_messages).to include("Manager must exist")
      end
    end
  end
end
