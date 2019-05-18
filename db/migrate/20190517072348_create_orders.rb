class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :delivery_zip_code
      t.string :delivery_home_address

      t.timestamps
    end
  end
end
