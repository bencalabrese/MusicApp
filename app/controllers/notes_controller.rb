class NotesController < ApplicationController
  before_action :ensure_login
  before_action :only_owner_can_change, only: :destroy

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save

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

  def only_owner_can_change
    if current_user.notes.find(params[:id]).nil?
      render text: "You can't edit that note", status: 403
    end
  end
end
