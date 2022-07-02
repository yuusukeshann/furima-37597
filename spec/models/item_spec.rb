require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '商品を出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'brand_nameが空では出品できない' do
        @item.brand_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Brand name can't be blank")
      end
      it 'expository_writingが空では出品できない' do
        @item.expository_writing = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Expository writing can't be blank")
      end
      it 'categoryが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_chargeが空では出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_shipが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以上でないと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥9,999,999を超えると出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数値以外だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end      
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
