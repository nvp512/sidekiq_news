class CreateExchangePairs < ActiveRecord::Migration
  def change
    create_table :exchange_pairs do |t|
      t.integer :exchange_id
      t.integer :pair_id

      t.timestamps null: false
    end
  end
end
