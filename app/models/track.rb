# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  album_id    :integer          not null
#  name        :string           not null
#  track_style :string           not null
#  lyrics      :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ActiveRecord::Base
  TRACK_STYLES = %w(bonus regular)

  validates :album_id, :name, :track_style, :lyrics, presence: true
  validates :track_style, inclusion: TRACK_STYLES
  
  belongs_to :album
end
