class AddCoverPhotoIdToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :cover_photo_id, :integer
  end
end
