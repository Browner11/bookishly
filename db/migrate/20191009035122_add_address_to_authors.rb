class AddAddressToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :address, :string
  end
end
