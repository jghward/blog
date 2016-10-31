class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true

  def create_cover(process)
    photo.now.recreate_versions!(process)
  end

  def next
    album.photos.where("id > ?", id).first || album.photos.first
  end

  def previous
    album.photos.where("id < ?", id).last || album.photos.last
  end

end
