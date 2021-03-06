# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.references :shopping_cart, foreign_key: true
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
