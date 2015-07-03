class Category < ActiveRecord::Base
  has_many :bug_categories
  has_many :bugs, through: :bug_categories

  validates :name, presence: true
end