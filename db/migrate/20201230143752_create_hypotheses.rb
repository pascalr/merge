class CreateHypotheses < ActiveRecord::Migration[6.0]
  def change
    create_table :hypotheses do |t|
      t.string :name
      t.float :value
      t.string :description

      t.timestamps
    end
  end
end
