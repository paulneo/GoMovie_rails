class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :gender
end
