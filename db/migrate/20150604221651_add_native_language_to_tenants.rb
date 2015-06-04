class AddNativeLanguageToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :native_language, :string
  end
end
