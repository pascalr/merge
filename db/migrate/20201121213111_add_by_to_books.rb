class AddByToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :by, :string
  end
end
