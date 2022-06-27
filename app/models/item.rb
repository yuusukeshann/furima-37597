class Item < ApplicationRecord

  validates :brand_name,           presence: true
  validates :expository_writing,   presence: true
  validates :category_id,          presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id,         presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id,   presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,        presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_to_ship_id,      presence: true,  numericality: { other_than: 1 , message: "can't be blank" }
  with_options  presence: true,  format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  
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
