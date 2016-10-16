class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_path, notice: "The photo has been uploaded."
    else
      render 'new'
    end
  end

private
  def photo_params
    params.require(:photo).permit(:title, :photo, :album_id)
  end
end
