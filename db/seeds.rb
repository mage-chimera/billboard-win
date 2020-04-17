require "csv"

CSV.foreach('db/seed_songs.csv') do |row|
  Song.create(title: row[0], display_artist: row[1], ranking: row[2], year: row[3])
end

CSV.foreach('db/seed_artists.csv') do |row|
  Artist.create(name: row[0])
end

CSV.foreach('db/seed_songartists.csv') do |row|
  SongArtist.create do |s|
    s.song_id   = Song.find_by(title: row[0], ranking: row[2], year: row[3]).id
    s.artist_id = Artist.find_by(name: row[1]).id
  end
end
