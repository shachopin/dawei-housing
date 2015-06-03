class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name, :gender, :url
      t.text :job_description
      t.boolean :has_pet, default: false
      t.timestamps
    end
  end
end
