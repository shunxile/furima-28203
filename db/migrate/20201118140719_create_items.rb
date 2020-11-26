class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :value, null: false
      t.integer :state_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :ship_area_id, null: false
      t.integer :ship_day_id, null: false
      t.integer :category_id, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
