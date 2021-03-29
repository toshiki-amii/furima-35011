class Item < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :category_id, :status_id, :delivery_fee_id, :prefecture_id, :preparation_day_id

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :preparation_day

  belongs_to :user
  # has_one :buy

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
