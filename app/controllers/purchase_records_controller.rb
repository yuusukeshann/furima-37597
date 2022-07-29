class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchaserecord_shippingaddress = PurchaserecordShippingaddress.new
   
  end

  # def new
  #   @purchaserecord_shippingaddress = PurchaserecordShippingaddress.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @purchaserecord_shippingaddress = PurchaserecordShippingaddress.new(purchase_record_params)
    if @purchaserecord_shippingaddress.valid?
      @purchaserecord_shippingaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchaserecord_shippingaddress).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  # def shipping_address_params
  #   params.permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :telephone_number).merge(purchase_record_id: @purchase_record.id)
  # end


end
