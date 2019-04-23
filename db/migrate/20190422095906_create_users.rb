class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :is_farmer
      t.text :description
      t.string :profile_picture_url
      t.string :openId

      t.timestamps
    end
  end
end
