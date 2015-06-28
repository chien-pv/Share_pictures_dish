class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :image
      t.text :desc
      t.text :processing
      t.integer :food_id
      t.integer :day_id
      t.integer :category_id
      t.string :address

      t.timestamps null: false
    end
  end
end
