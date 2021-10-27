class OrderDestination
  include ActiveModel::Model
  attr_accessor :authenticity_token, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}[-][0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is too short"}, numericality: { only_integer: true , message: "is invalid. Input only number"}
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end