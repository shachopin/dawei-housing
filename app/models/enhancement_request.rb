class EnhancementRequest < ActiveRecord::Base
  belongs_to :creator, foreign_key: "tenant_id", class_name: "Tenant"
end