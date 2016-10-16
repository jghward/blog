class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to albums_path, notice: "The album has been created."
    else
      render 'new'
    end
  end

private
  def album_params
    params.require(:album).permit(:title)
  end
end
