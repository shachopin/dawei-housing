class Category < ActiveRecord::Base
  has_many :bug_categories
  has_many :categories, through: :bug_categories
end