class AddNameToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :name, :string
  end
end
