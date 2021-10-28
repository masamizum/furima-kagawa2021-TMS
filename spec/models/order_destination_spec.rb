require 'rails_helper'

RSpec.describe OrderDestination, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    sleep 0.1 # 0.1秒待機
  end
  
  describe '配送先情報の保存' do
    context '保存ができる場合' do
      it '必須項目が全て入力されていたら保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では保存できない" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @order_destination.postal_code=''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列の形式でないと保存できない' do
        @order_destination.postal_code='1234-567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できない' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'prefectureが「--」では登録できない' do
        @order_destination.prefecture_id = "1"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_destination.city=''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では保存できない' do
        @order_destination.addresses=''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_destination.phone_number =''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @order_destination.phone_number ='123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_destination.phone_number ='123456789012'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが半角数値の形式でないと保存できない' do
        @order_destination.phone_number ='090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end