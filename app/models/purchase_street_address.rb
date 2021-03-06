class PurchaseStreetAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :phone_number, :buliding_name,
                :purchase_id, :user_id, :item_id, :token
  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :prefecture_id
  end

  def save 
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                          address: address, buliding_name: buliding_name, phone_number: phone_number, purchase_id: purchase.id)
    end
end