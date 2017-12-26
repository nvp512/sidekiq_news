class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :base_currency
      t.string :unit_currency
      
      t.timestamps null: false
    end
  end
end
