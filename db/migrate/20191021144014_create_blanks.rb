class CreateBlanks < ActiveRecord::Migration[6.0]
  def change
    create_table :blanks do |t|
      t.string :speech_part
      t.references :madlib, null: false, foreign_key: true
      t.string :input, default: ""

      t.timestamps
    end
  end
end
