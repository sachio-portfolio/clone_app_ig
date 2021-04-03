class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belong_to :user
end
