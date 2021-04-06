require 'rails_helper'

RSpec.describe BuyBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_buyer = FactoryBot.build(:buy_buyer, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end

  describe '購入について' do
    context '購入できるとき' do
      it '情報が全て正しく存在すれば購入できる' do
        expect(@buy_buyer).to be_valid
      end
      it 'buildingが無くともそれ以外の情報が全て正しく存在すれば購入できる' do
        @buy_buyer.building = ''
        expect(@buy_buyer).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空では登録できない' do
        @buy_buyer.token = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Token カード情報を正しく入力してください。')
      end

      it 'postalが空では登録できない' do
        @buy_buyer.postal = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと登録できない' do
        @buy_buyer.postal = '1234567'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Postal is invalid')
      end

      it 'prefecture_idが1では登録できない' do
        @buy_buyer.prefecture_id = 1
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では登録できない' do
        @buy_buyer.city = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できない' do
        @buy_buyer.address = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空では登録できない' do
        @buy_buyer.phone = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが数字でないと登録できない' do
        @buy_buyer.phone = 'aaaaaaaaaaa'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone is not a number')
      end
      it 'phoneが10文字11文字でないと登録できない' do
        @buy_buyer.phone = '111111111'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone is invalid')
      end

      it 'user_idが空では登録できない' do
        @buy_buyer.user_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @buy_buyer.item_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
