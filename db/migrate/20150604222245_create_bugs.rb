class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :body
      t.integer :tenant_id
      t.timestamps
    end
  end
end
