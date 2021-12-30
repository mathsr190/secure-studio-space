require 'rails_helper'

RSpec.describe Manager, type: :model do
  before do
    @manager = FactoryBot.build(:manager)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it 'email,スタジオ名、スタジオ名(かな)、passwordが存在すれば登録できる' do
        expect(@manager).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'emailが殻では登録できない' do
        @manager.email = ''
        @manager.valid?
        expect(@manager.errors.full_messages).to include("Email can't be blank")
      end
    end
  end
end