class CreateRoomComments < ActiveRecord::Migration
  def change
    create_table :room_comments do |t|
      t.text :body
      t.integer :room_id      
      t.timestamps
    end
  end
end
