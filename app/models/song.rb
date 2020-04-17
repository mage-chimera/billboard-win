class Song < ApplicationRecord
  paginates_per 40

  def self.ransackable_attributes(auth_object = nil)
    %w(title display_artist year)
  end

  has_many :song_artists
  has_many :artists, through: :song_artists
end
