class CreateFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :formats do |t|

      t.timestamps
    end
  end
end
