class AddCommentToTenants < ActiveRecord::Migration
  def change
    add_column(:tenants, :comment, :text)
  end
end
