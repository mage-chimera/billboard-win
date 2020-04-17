class Artist < ApplicationRecord
  has_many :song_artists
  has_many :songs, through: :song_artists
end
