class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.float :nb_months
      t.text :description

      t.timestamps
    end
  end
end
