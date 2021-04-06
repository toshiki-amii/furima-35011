class BuyBuyer
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :phone, numericality: { only_integer: true }, format: { with: /\A\d{10,11}\z/ }
  end

  validates :token, presence: { message: 'カード情報を正しく入力してください。' }

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone,
                 buy_id: buy.id)
  end
end
