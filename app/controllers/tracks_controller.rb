class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render :index
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def new
    @track = Track.new
    @track.album = Album.find(params[:album_id])
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)

    if @track.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end

  private
  def track_params
    params.require(:track).permit(
      :name,
      :track_style,
      :album_id,
      :lyrics)
  end
end
