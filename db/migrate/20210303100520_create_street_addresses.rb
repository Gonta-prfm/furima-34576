class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string     :postal_code,   null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :buliding_name
      t.string     :phone_number,  null: false
      t.integer    :prefecture_id, null: false
      t.references :purchase,      foreign_key: true
      t.timestamps
    end
  end
end
