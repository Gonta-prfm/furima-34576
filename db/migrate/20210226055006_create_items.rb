class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name
      t.text       :description
      t.integer    :price
      t.integer    :category_id
      t.integer    :status_id
      t.integer    :shopping_charge_id
      t.integer    :shopping_area_id
      t.integer    :days_to_shop_id
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
