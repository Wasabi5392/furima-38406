class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+.[a-z]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  KANA_REGEX = /\A[ァ-ヶ]+\z/

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :firstname_in_kanji, presence: true, format: { with: NAME_REGEX }
  validates :lastname_in_kanji, presence: true, format: { with: NAME_REGEX }
  validates :firstname_in_kana, presence: true, format: { with: KANA_REGEX }
  validates :lastname_in_kana, presence: true, format: { with: KANA_REGEX }
  validates :birthday, presence: true
end
