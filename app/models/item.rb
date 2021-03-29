class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  belongs_to :user

  has_one_attached :image

  validates :product,     presence: true
  validates :explanation, presence: true
  validates :image,       presence: true

  # ---を排除
  validates :category_id,        numericality: { other_than: 1 }
  validates :status_id,          numericality: { other_than: 1 }
  validates :delivery_fee_id,    numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }

  # 数字を数字のみにし、範囲を指定
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
end
