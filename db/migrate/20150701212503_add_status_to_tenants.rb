class AddStatusToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :status, :string, default: "PENDING"
  end
end
