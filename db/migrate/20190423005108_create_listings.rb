class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
