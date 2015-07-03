class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name, :url
      t.string :gender, default: "female"
      t.text :job_description
      t.boolean :has_pet, default: false
      t.string :contact
      t.timestamps
    end
  end
end
