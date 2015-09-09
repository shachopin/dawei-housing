class Like < ActiveRecord::Base
  belongs_to :creator, class_name:"User", foreign_key: "user_id"
  belongs_to :likeable, polymorphic: true
end