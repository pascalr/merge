class AddChordsToMusics < ActiveRecord::Migration[6.0]
  def change
    add_column :musics, :chords, :text
  end
end
