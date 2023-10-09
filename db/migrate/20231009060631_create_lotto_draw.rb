class CreateLottoDraw < ActiveRecord::Migration[7.1]
  def change
    create_table :lotto_draws do |t|
      t.integer :code
      t.string :name
      t.integer :draw_id
      t.integer :sequence_number
      t.integer :roll_over_number
      t.datetime :draw_date

      t.timestamps
    end
  end
end
