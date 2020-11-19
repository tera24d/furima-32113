class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  validates :name, :info, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :sales_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :schedule_delivery_id, numericality: { other_than: 1 } 

end
