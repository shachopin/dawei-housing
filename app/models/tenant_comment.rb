class TenantComment < ActiveRecord::Base
  belongs_to :tenant
  validates :body, presence: true
end