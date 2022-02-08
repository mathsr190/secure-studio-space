require 'rails_helper'

RSpec.describe SpaceForm, type: :model do
  describe '部屋登録' do
    before do
      studio = FactoryBot.create(:studio)
      @space_form = FactoryBot.build(:space_form, studio_id: studio.id)
      @space_form.image = fixture_file_upload('public/images/space_test_image.png')
      @space_form.save
      sleep(0.15)
    end

    context '部屋登録できる場合' do
      it '全項目(紹介文、部屋名、部屋名(かな)、幅、奥行き、面積、高さ、使用料金(朝)、使用料金(昼)、使用料金(夜))、studio紐付けがあれば保存できる' do
        expect(@space_form).to be_valid
      end
    end

    context '部屋登録できない場合' do
      it 'imageが空では保存できない' do
        @space_form.image = nil
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Image can't be blank")
      end
      it '紹介文が空では保存できない' do
        @space_form.info = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Info can't be blank")
      end
      it '紹介文が100文字以上では保存できない' do
        @space_form.info = Faker::Lorem.characters(number: 100)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Info is too long')
      end
      it '部屋名が空では保存できない' do
        @space_form.space_name = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Space name can't be blank")
      end
      it '部屋名(かな)が空では保存できない' do
        @space_form.space_name_kana = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Space name kana can't be blank")
      end
      it '部屋名(かな)が半角英数字では保存できない' do
        @space_form.space_name_kana = Faker::Name.last_name
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Space name kana is invalid')
      end
      it '部屋名(かな)がカタカナでは保存できない' do
        @space_form.space_name_kana = Gimei.name.last.katakana
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Space name kana is invalid')
      end
      it '幅が空では保存できない' do
        @space_form.length = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Length can't be blank")
      end
      it '幅が0未満では保存できない' do
        @space_form.length = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Length is invalid')
      end
      it '幅が0では保存できない' do
        @space_form.length = 0
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Length is invalid')
      end
      it '幅が2500以上では保存できない' do
        @space_form.length = Faker::Number.between(from: 2500)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Length is invalid')
      end
      it '奥行きが空では保存できない' do
        @space_form.width = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Width can't be blank")
      end
      it '奥行きが0未満では保存できない' do
        @space_form.width = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Width is invalid')
      end
      it '奥行きが0では保存できない' do
        @space_form.width = 0
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Width is invalid')
      end
      it '奥行きが2500以上では保存できない' do
        @space_form.width = Faker::Number.between(from: 2500)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Width is invalid')
      end
      it '面積が空では保存できない' do
        @space_form.size = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Size can't be blank")
      end
      it '面積が0未満では保存できない' do
        @space_form.size = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Size is invalid')
      end
      it '面積が0では保存できない' do
        @space_form.size = 0
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Size is invalid')
      end
      it '面積が2500以上では保存できない' do
        @space_form.size = Faker::Number.between(from: 2500)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Size is invalid')
      end
      it '高さが空では保存できない' do
        @space_form.height = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Height can't be blank")
      end
      it '高さが0未満では保存できない' do
        @space_form.height = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Height is invalid')
      end
      it '高さが0では保存できない' do
        @space_form.height = 0
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Height is invalid')
      end
      it '高さが2500以上では保存できない' do
        @space_form.height = Faker::Number.between(from: 2500)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Height is invalid')
      end
      it '使用料金(朝)が空では保存できない' do
        @space_form.fee_morning = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Fee morning can't be blank")
      end
      it '使用料金(朝)が0未満では保存できない' do
        @space_form.fee_morning = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee morning is invalid')
      end
      it '使用料金(朝)が小数では保存できない' do
        @space_form.fee_morning = Faker::Number.decimal(r_digits: 1)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee morning is invalid')
      end
      it '使用料金(昼)が空では保存できない' do
        @space_form.fee_day = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Fee day can't be blank")
      end
      it '使用料金(昼)が0未満では保存できない' do
        @space_form.fee_day = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee day is invalid')
      end
      it '使用料金(昼)が小数では保存できない' do
        @space_form.fee_day = Faker::Number.decimal(r_digits: 1)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee day is invalid')
      end
      it '使用料金(夜)が空では保存できない' do
        @space_form.fee_night = ''
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include("Fee night can't be blank")
      end
      it '使用料金(夜)が0未満では保存できない' do
        @space_form.fee_night = Faker::Number.negative
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee night is invalid')
      end
      it '使用料金(夜)が小数では保存できない' do
        @space_form.fee_night = Faker::Number.decimal(r_digits: 1)
        @space_form.valid?
        expect(@space_form.errors.full_messages).to include('Fee night is invalid')
      end
    end
  end
end
