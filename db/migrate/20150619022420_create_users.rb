class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :username
      t.timestamps
    end
  end
end