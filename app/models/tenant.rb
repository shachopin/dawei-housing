class Tenant < ActiveRecord::Base
  has_many :bugs
  has_many :enhancement_requests
end