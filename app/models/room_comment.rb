class RoomComment < ActiveRecord::Base
  belongs_to :room 
  validates :body, presence: true
end