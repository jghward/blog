class Album < ApplicationRecord
  belongs_to :collection
  has_many :photos
  def has_cover?
    cover_photo_id.present? && Photo.exists?(cover_photo_id)
  end
end
