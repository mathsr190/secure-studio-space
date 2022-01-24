require 'rails_helper'

RSpec.describe ReservationForm, type: :model do
  describe 'スペース予約' do
    before do
      space = FactoryBot.create(:space) #このテストではfactories/space.rbでcreateする。通常のspaceはspace_formから作成している。
      user = FactoryBot.create(:user)
      @reservation_form = FactoryBot.build(:reservation_form, space_id: space.id, user_id: user.id)
      sleep(0.3)
    end
    context '予約できる場合' do
      it '全項目(使用開始時刻、使用終了時刻、値段、クレジットカード情報)が入力されていたら予約できる' do
        expect(@reservation_form).to be_valid
      end
    end
    context '予約できない場合' do
      it '使用開始時刻が空だと保存できない' do
      @reservation_form.time_start = ''
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Time start can't be blank")
      end
      it '使用開始時刻が現在時間より前だと保存できない' do
      @reservation_form.time_start = Faker::Time.between_dates(from: Date.today - 90, to: Date.today - 1 , period: :all)
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Time start can't be in the past")
      end
      it '使用終了時刻が空だと保存できない' do
      @reservation_form.time_end = ''
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Time end can't be blank")
      end
      it '使用終了時刻が使用開始時刻よろい前だと保存できない' do
      @reservation_form.time_end = @reservation_form.time_start - 1
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Time end can't be earlier than the time start")
      end
      it '値段が空だと保存できない' do
      @reservation_form.price = ''
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Price can't be blank")
      end
      it '値段が小数だと保存できない' do
      @reservation_form.price = 2400.1
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Price is invalid")
      end
      it '値段が全角数字だと保存できない' do
      @reservation_form.price = '２４００'
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Price is invalid")
      end
      it '値段がマイナスだと保存できない' do
      @reservation_form.price = -1
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Price is invalid")
      end
      it 'トークンが空だと保存できない' do
      @reservation_form.token = nil
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'space_idが空だと保存できない' do
      @reservation_form.space_id = nil
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("Space can't be blank")
      end
      it 'user_idが空だと保存できない' do
      @reservation_form.user_id = nil
      @reservation_form.valid?
      expect(@reservation_form.errors.full_messages).to include("User can't be blank")
      end
    end

  end
end