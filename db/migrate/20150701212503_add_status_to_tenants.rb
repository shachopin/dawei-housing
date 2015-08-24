class AddStatusToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :status, :string, default: "Pending"
  end
end
