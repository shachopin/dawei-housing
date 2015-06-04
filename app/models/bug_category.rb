class BugCategory < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :category
end