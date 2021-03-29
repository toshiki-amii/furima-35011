class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  validates :birth,       presence: true

  # 姓名にひらがなカタカナ漢字々ーを設定
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :family_name
    validates :first_name
  end

  # 読み仮名にカタカナとーを設定
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :read_family
    validates :read_first
  end
  
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  has_many :items
  # has_many :buys
end
