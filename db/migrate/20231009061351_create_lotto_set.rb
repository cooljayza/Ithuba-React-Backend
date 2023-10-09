class CreateLottoSet < ActiveRecord::Migration[7.1]
  def change
    create_table :lotto_sets do |t|
      t.references :lotto_draw, foreign_key: true, type: :integer
      t.integer :rank
      t.timestamps
    end
  end
end
