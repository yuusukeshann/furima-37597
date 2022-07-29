require 'rails_helper'

RSpec.describe PurchaserecordShippingaddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchaserecord_shippingaddress = FactoryBot.build(:purchaserecord_shippingaddress, user_id: user.id, item_id: item.id)
      # @purchaserecord_shippingaddress = FactoryBot.build(:purchaserecord_shippingaddress)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaserecord_shippingaddress).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchaserecord_shippingaddress.building_name = ''
        expect(@purchaserecord_shippingaddress).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchaserecord_shippingaddress.post_code = ''
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchaserecord_shippingaddress.post_code = '3333333'
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchaserecord_shippingaddress.prefecture_id = ''
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureに「---」が選択されている場合は出品できない' do
        @purchaserecord_shippingaddress.prefecture_id = '1'
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchaserecord_shippingaddress.city = ''
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できないこと' do
        @purchaserecord_shippingaddress.post_code = ''
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Post code can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchaserecord_shippingaddress.telephone_number = ''
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが全角数字だと保存できないこと' do
        @purchaserecord_shippingaddress.telephone_number = '０１２２９４５５５５'
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberがハイフンを含んでいると保存できないこと' do
        @purchaserecord_shippingaddress.telephone_number = '090-0000-00'
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchaserecord_shippingaddress.user_id = nil
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchaserecord_shippingaddress.item_id = nil
        @purchaserecord_shippingaddress.valid?
        expect(@purchaserecord_shippingaddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
