class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :gender

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
