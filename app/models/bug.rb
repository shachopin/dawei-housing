class Bug < ActiveRecord::Base
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :bug_categories
  has_many :categories, through: :bug_categories

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end