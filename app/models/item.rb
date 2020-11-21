class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

    with_options numericality: { other_than: 0, message: 'select' } do
      validates :category_id
      validates :sales_status_id
      validates :prefecture_id
      validates :shipping_fee_status_id
      validates :scheduled_delivery_id
    end
    # VALID_NUMBER_REGEX =
  end
end
