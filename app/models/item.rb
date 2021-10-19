class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image

  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
end
