class AddNameToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :name, :string
  end
end
