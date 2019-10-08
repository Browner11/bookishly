class AddNameToFormat < ActiveRecord::Migration[6.0]
  def change
    add_column :formats, :name, :string
  end
end
