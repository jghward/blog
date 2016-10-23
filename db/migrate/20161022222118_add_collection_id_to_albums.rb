class AddCollectionIdToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :collection_id, :integer
  end
end
