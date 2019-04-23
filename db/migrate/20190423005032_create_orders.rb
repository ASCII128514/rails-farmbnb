class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
