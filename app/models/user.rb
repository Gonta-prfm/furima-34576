class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end
  validates :password,           presence: true, 
                                 format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, 
                                 message: ''}
  validates :first_name, 
            :family_name,        presence: true,
                                 format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,
                                 messsage: ''}
  validates :first_name_kana, 
            :family_name_kana,   presence: true, 
                                 format: {with: /\A[ァ-ンー－]+\z/,
                                 message: ''}
end
