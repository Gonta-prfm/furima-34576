class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charge
  belongs_to :shopping_area
  belongs_to :days_to_shop
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shopping_charge_id
      validates :shopping_area_id
      validates :days_to_shop_id
    end
    validates :price, numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
  end
end
