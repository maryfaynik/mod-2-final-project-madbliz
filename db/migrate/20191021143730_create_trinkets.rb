class CreateTrinkets < ActiveRecord::Migration[6.0]
  def change
    create_table :trinkets do |t|
      t.references :favorite, foreign_key: true
      t.float :price, default: 10.00
      t.string :product_type
      t.timestamps
    end
  end
end
