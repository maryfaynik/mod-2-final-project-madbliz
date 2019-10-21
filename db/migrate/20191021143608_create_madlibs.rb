class CreateMadlibs < ActiveRecord::Migration[6.0]
  def change
    create_table :madlibs do |t|
      t.string :title
      t.text :body
      t.string :catgegory

      t.timestamps
    end
  end
end
