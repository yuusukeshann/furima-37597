class Item < ApplicationRecord

  validates :brand_name,           presence: true
  validates :expository_writing,   presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :delivery_charge_id,   presence: true
  validates :prefecture_id,        presence: true
  validates :days_to_ship_id,      presence: true
  validates :price,                presence: true
  
   # belongs_to :item
  #  has_one :purchase_record
   has_one_attached :image

end
