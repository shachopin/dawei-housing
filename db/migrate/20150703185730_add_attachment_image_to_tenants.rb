class AddAttachmentImageToTenants < ActiveRecord::Migration
  def self.up
    change_table :tenants do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tenants, :image
  end
end
