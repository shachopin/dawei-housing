class BugCategory < ActiveRecord::Base
  belongs_to :bug
  belongs_to :category
end