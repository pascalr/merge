class AddSurnomToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :surnom, :string
  end
end
