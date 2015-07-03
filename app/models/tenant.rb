class Tenant < ActiveRecord::Base
  validates :name, presence: true
  validates :contact, presence: true
  validates :job_description, presence: true
end