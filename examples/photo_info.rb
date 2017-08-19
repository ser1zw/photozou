require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get albums
albums = client.photo_album
album_id = albums[0].album_id

# Get photos in the album
photos = client.photo_album_photo(album_id)

photo_id = photos[0].photo_id

photo = client.photo_info(photo_id)

puts "photo_id = #{photo.photo_id}"
puts "photo_title = #{photo.photo_title}"
puts "description = #{photo.description}"
puts "size = #{photo.original_width}x#{photo.original_height}"
puts "url = #{photo.url}"
puts "image_url = #{photo.image_url}"
puts "original_image_url = #{photo.original_image_url}"
puts "tags = [#{photo.tags.join(', ')}]"
