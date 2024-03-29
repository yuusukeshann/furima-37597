class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    #メモ @item = Item.find(params[:item_id])
    @purchaserecord_shippingaddress = PurchaserecordShippingaddress.new
    redirect_to root_path if @item.purchase_record || (current_user.id == @item.user_id)
  end

  def create
    #メモ @item = Item.find(params[:item_id])
    @purchaserecord_shippingaddress = PurchaserecordShippingaddress.new(purchase_record_params)
    if @purchaserecord_shippingaddress.valid?
      pay_item
      @purchaserecord_shippingaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
  @item = Item.find(params[:item_id])
  end


  def purchase_record_params
    params.require(:purchaserecord_shippingaddress).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
