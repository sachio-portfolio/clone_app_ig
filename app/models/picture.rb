class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :image, presence: true
  validates :content, length: { maximum: 2200 }
end
