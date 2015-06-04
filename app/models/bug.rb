class Bug < ActiveRecord::Base
  belongs_to :creator, foreign_key: "tenant_id", class_name: "Tenant"
  has_many :bug_categories
  has_many :categories, through: :bug_categories
end
