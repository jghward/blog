class Album < ApplicationRecord
  belongs_to :collection
  has_many :photos
end
