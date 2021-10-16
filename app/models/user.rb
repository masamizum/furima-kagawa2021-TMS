class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders       

  validates :nickname, presence: { message: "Nickname can't be blank" }
  # メールアドレスはdeviseで必要なバリデーション有り

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers' 
  # passwordはdeviseでその他必要なバリデーション有り

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'name is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end
 
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'name kana is invalid. Input full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birth_date, presence: true


end