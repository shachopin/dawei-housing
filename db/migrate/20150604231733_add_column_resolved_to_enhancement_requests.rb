class AddColumnResolvedToEnhancementRequests < ActiveRecord::Migration
  def change
    add_column :enhancement_requests, :resolved, :boolean, default: false
  end
end
