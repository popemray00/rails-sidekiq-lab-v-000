class SongsWorker
include Sidekiq::Worker

def perform(songs_file)
  CSV.foreach(songs_file, headers: true) do |song|
    Song.create(title: song[0], artist_name: song[1])
  end
  redirect_to songs_path
end
