class AddSummaryToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :summary, :text
  end
end
