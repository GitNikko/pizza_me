class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  # Default scope pulls the reviews out of the database in descending order (newest at the top)
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader 
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
  validates :rating, presence: true
  validate :picture_size
  
  private
  
  # Validates the size of an uploaded image.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
      
end
