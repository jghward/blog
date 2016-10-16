class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
end
