class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :like
      t.integer :user_id
      t.integer :dish_id
    end
  end
end
