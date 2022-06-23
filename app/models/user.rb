class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :birthday,             presence: true
  # memo validates :family_name,          presence: true
  # memo validates :first_name,           presence: true
  # memo validates :family_name_kana,     presence: true
  # memo validates :first_name_kana,      presence: true
 

  with_options presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    #  memo VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字を両方含む必要があります' } 

  
  # has_many :items
  # has_many :purchase_records
end
