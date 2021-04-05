class BuyBuyer
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :address, :building, :phone, :buy_id, :user_id, :item_id

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :buy_id
    validates :user_id
    validates :item_id
    validates :phone, numericality: { only_integer: true }
  end

  validates :prefecture_id, numericality: {other_than: 1 }
  

  def save
    buy = Buy.create(user_id: user.id, item_id: item.id )
    buyer.create(postal: postal, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, buy_id: buy.id)
  end

end
