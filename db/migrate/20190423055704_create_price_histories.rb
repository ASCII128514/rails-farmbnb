class CreatePriceHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :price_histories do |t|
      t.references :product, foreign_key: true
      t.integer :previous_price

      t.timestamps
    end
  end
end
