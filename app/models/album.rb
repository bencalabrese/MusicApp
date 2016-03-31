# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  band_id         :integer          not null
#  recording_style :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#

class Album < ActiveRecord::Base
  RECORDING_STYLES = %w(live studio)

  validates :name, :recording_style, :band_id, presence: true
  validates :recording_style, inclusion: RECORDING_STYLES
  
  belongs_to :band, dependent: :destroy
end
