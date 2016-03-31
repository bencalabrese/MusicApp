class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def new
    @album = Album.new
    @album.band = Band.find(params[:band_id])
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)

    if @album.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  private
  def album_params
    params.require(:album).permit(:name, :recording_style, :band_id)
  end
end
