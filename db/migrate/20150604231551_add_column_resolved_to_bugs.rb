class AddColumnResolvedToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :resolved, :boolean, default: false
  end
end
