class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null:false
      t.integer :state_id, null:false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :building_name
      t.string :phone_number, null: false, precision: 11
      t.references :item, null: false
      t.timestamps
    end
  end
end
