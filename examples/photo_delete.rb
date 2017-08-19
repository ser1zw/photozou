require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get albums
albums = client.photo_album
album_id = albums[0].album_id

# Get photos
photos = client.photo_album_photo(album_id)

# Delete all photos
photos.each { |photo|
  client.photo_delete(photo.photo_id)
}
