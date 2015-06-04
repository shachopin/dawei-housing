class CreateBugCategory < ActiveRecord::Migration
  def change
    create_table :bug_categories do |t|
      t.integer :bug_id, :category_id
      t.timestamp
    end
  end
end
