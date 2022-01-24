require 'rails_helper'

RSpec.describe Manager, type: :model do
  before do
    @manager = FactoryBot.build(:manager)
  end

  describe 'マネージャー新規登録' do
    context '新規登録できる場合' do
      it 'email,スタジオ名、スタジオ名(かな)、passwordが存在すれば登録できる' do
        expect(@manager).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'emailが空では登録できない' do
        @manager.email = ''
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが@を含まないと登録できない' do
        @manager.email = 'testgmail.com'
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @manager.save
        another_manager = FactoryBot.build(:manager, email: @manager.email)
        another_manager.valid?
        expect(another_manager.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @manager.password = ''
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @manager.password = 'abc12'
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @manager.password = 'abcdef'
        @manager.password_confirmation = 'abcdef'
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角では登録できない' do
        @manager.password = 'ぱすわーどてすと'
        @manager.password_confirmation = 'ぱすわーどてすと'
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @manager.password = 'abc123'
        @manager.password_confirmation = '123abc'
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'スタジオ名が空では登録できない' do
        @manager.studio_name = ''
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Studio name can't be blank")
      end
      it 'スタジオ名(かな)が空では登録できない' do
        @manager.studio_name_kana = ''
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Studio name kana can't be blank")
      end
      it 'スタジオ名(かな)が半角英数字では登録できない' do
        @manager.studio_name_kana = Faker::Name.last_name
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Studio name kana is invalid')
      end
      it 'スタジオ名(かな)がカタカナでは登録できない' do
        @manager.studio_name_kana = Gimei.name.last.katakana
        @manager.valid?
        expect(@manager.errors.full_messages).to include('Studio name kana is invalid')
      end
    end
  end
end
