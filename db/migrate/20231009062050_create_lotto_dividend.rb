class CreateLottoDividend < ActiveRecord::Migration[7.1]
  def change
    create_table :lotto_dividends do |t|
      t.references :lotto_set, foreign_key: true, type: :integer
      t.integer :rank
      t.decimal :share_value
      t.decimal :num_of_shares
      t.decimal :amount_paid
      t.decimal :next_draw_rollover

      t.timestamps
    end
  end
end
