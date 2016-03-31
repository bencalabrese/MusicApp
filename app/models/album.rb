class Album < ActiveRecord::Base
  validates :recording_style, :band_id, presence: true

  belongs_to :band, dependent: :destroy
end
