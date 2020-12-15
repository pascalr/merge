class AddNameToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :name, :string
  end
end
