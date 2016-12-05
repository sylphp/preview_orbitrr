class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :story
      t.decimal :price

      t.timestamps
    end
  end
end
