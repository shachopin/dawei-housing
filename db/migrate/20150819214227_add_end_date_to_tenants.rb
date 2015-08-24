class AddEndDateToTenants < ActiveRecord::Migration
  def change
    add_column(:tenants, :end_date, :datetime)
  end
end
