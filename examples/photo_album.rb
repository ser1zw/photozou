require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get albums
albums = client.photo_album
albums.each { |album|
  puts "#{album.album_id}\t#{album.name}\t#{album.created_time}"
}
