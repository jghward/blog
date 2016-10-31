class Collection < ApplicationRecord
  has_many :albums

  def has_cover?
    cover_photo_id.present?
  end

end
