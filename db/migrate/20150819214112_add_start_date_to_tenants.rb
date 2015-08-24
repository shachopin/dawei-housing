class AddStartDateToTenants < ActiveRecord::Migration
  def change
    add_column(:tenants, :start_date, :datetime)
  end
end
