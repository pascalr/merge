class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :interest
      t.integer :zero_waste
      t.string :raw_concerns
      t.string :raw_would_buy
      t.string :raw_evaluation
      t.string :would_fill
      t.string :how_to_pay
      t.string :how_to_fix
      t.string :region
      t.string :gender
      t.string :revenue
      t.string :how_many_people

      t.timestamps
    end
  end
end
