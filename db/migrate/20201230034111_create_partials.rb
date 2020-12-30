class CreatePartials < ActiveRecord::Migration[6.0]
  def change
    create_table :partials do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
