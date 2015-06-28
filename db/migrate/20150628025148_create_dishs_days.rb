class CreateDishsDays < ActiveRecord::Migration
  def change
    create_table :dishs_days do |t|
      t.integer :dish_id
      t.integer :day_id
    end
  end
end
