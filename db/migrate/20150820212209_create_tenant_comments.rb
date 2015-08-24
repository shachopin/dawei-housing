class CreateTenantComments < ActiveRecord::Migration
  def change
    create_table :tenant_comments do |t|
      t.text :body
      t.integer :tenant_id
      t.timestamps
    end
  end
end
