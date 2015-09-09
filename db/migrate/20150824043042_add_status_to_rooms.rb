class AddStatusToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :status, :string, default: "Available"
  end
end
