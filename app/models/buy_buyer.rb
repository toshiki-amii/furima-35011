class BuyBuyer
  Include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :address, :building, :phone, :buy_id, :token

  with_options presence :true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city, :address, :phone, :buy_id, :token
  end

  validates :prefecture_id, numericality: {other_than: 1 }

  def save
    buy = Buy.create(token: token)
    buyer.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, buy_id: buy.id)
  end

end
