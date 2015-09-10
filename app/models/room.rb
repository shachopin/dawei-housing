class Room < ActiveRecord::Base
  validates :title, presence: true
  
  has_attached_file :image, styles: {large: "550x550>", medium: "300x300>  ", thumb:"100x100>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :room_comments, dependent: :destroy

  def like_true_size
    likes.where(like: true).size
  end

  def like_false_size
    self.likes.where(like: false).size
  end

  def votes_total
    like_true_size + like_false_size
  end

  def votes_difference
    like_true_size - like_false_size
  end

end