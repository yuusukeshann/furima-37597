class PurchaserecordShippingaddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_number, :building_name, :telephone_number, :user_id, :item_id, :token 

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_number
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}, length: {maximum: 11}
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :token
  end

  def save
    purchaserecord = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchaserecord.id)

  end

end
