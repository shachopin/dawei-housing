class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id
      t.string  :likeable_type
      t.integer :likeable_id
      t.timestamps
    end
  end
end
