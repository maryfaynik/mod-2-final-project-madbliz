class CreateTrinkets < ActiveRecord::Migration[6.0]
  def change
    create_table :trinkets do |t|
      t.references :favorite, null: false, foreign_key: true
      t.float :price, default: 10.00
      t.string :product_type
      t.timestamps
    end
  end
end
