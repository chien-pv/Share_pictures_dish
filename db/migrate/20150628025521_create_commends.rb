class CreateCommends < ActiveRecord::Migration
  def change
    create_table :commends do |t|
      t.text :comment
      t.integer :user_id
      t.integer :dish_id
    end
  end
end
