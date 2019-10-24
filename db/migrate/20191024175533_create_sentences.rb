class CreateSentences < ActiveRecord::Migration[6.0]
  def change
    create_table :sentences do |t|
      t.string :value
      t.references :madlib, foreign_key: true

      t.timestamps
    end
  end
end
