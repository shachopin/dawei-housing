class Tenant < ActiveRecord::Base
  validates :name, presence: true
  validates :contact, presence: true
  validates :job_description, presence: true

  has_attached_file :image, styles: {medium: "300x300>  ", thumb:"100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :tenant_comments, dependent: :destroy
end