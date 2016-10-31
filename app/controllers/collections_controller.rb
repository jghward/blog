class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end
  
  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to collections_path, notice: "The collection has been created."
    else
      render 'new'
    end
  end

  def destroy
  end

private

  def collection_params
    params.require(:collection).permit(:title)
  end

end
