class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :num_pages
      t.references :genre, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.references :format, null: false, foreign_key: true

      t.timestamps
    end
  end
end
