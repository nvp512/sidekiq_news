class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.decimal :price, :precision => 8, :scale => 4
      t.decimal :total_supply, :precision => 8, :scale => 4
      t.decimal :price_24h_before, :precision => 8, :scale => 4
      t.text :overview

    end
  end
end
