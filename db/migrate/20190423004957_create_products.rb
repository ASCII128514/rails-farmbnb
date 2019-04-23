# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :product_price
      t.text :description
      t.string :picture_url
      t.string :unit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
