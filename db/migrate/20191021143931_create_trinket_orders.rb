class CreateTrinketOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :trinket_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :trinket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
