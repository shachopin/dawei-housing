class Room < ActiveRecord::Base
  validates :title, presence: true
  
  has_attached_file :image, styles: {large: "550x550>", medium: "300x300>  ", thumb:"100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end