class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @album = Album.find(@photo.album_id)
    @collection = Collection.find(@album.collection_id)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @album = Album.find(@photo.album_id)

    if @photo.save
      redirect_to album_path(@album), notice: "The photo has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  def make_album_cover
    @photo = Photo.find(params[:id])
    @photo.create_cover(:albumcover)
    @album = Album.find(@photo.album_id)
    @album.cover_photo_id = @photo.id
    @album.save
  end

  def make_collection_cover
    @photo = Photo.find(params[:id])
    @photo.create_cover(:collectioncover)
    @album = Album.find(@photo.album_id)
    @collection = Collection.find(@album.collection_id)
    @collection.cover_photo_id = @photo.id
    @collection.save
  end

private
  def photo_params
    params.require(:photo).permit(:title, :photo, :album_id)
  end
end
