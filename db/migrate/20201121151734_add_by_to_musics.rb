class AddByToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :by, :string
  end
end
