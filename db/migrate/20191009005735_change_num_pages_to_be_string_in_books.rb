class ChangeNumPagesToBeStringInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :num_pages, :string
  end
end
