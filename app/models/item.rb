class Item < ApplicationRecord

  validates :brand_name,           presence: true
  validates :expository_writing,   presence: true
  validates :category_id,          presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,         presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id,   presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,        presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_to_ship_id,      presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :price,                presence: true
  
   # belongs_to :item
  #  has_one :purchase_record
   has_one_attached :image

   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :condition
   belongs_to :days_to_ship
   belongs_to :delively_charge
   belongs_to :prefecture
   
end
