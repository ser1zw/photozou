require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get albums
albums = client.photo_album
album_id = albums[0].album_id

photos = client.photo_album_photo(album_id)
photos.each { |photo|
  puts "#{photo.photo_id}\t#{photo.photo_title}\t[#{photo.tags.join(', ')}]\t#{photo.image_url}\t#{photo.original_image_url}"
}
