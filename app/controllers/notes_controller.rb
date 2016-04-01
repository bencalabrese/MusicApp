class NotesController < ApplicationController
  before_action :ensure_login

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save

    redirect_to track_url(@note.track)
  end

  def new
    @note = Note.new
    @note.track = Track.find(params[:track_id])

    render :new
  end

  def edit
    @note = Note.find(params[:id])
    render :edit
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)

    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy
    redirect_to track_url(@track)
  end

  private
  def note_params
    params.require(:note).permit(
      :user_id,
      :track_id,
      :message)
  end
end
