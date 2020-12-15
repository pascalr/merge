class AddNameToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :name, :string
  end
end
