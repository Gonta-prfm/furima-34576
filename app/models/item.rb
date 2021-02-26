class Item < ApplicationRecord
  belongs_to :user
  
  with_options presense: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :status_id
    validates :shopping_charge_id
    validates :shopping_area_id
    validates :days_to_shop_id
  end
end
