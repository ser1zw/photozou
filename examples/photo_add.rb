require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

image = open(File.dirname(__FILE__) + '/Lenna.png', 'r')

# Get albums
albums = client.photo_album
album_id = albums[0].album_id

# Post image to album
res = client.photo_add(album_id, image, 'image/png',
                       { photo_title: 'Lenna',
                         description: 'Lenna or Lena is the name given to a standard test image widely used in the field of image processing since 1973.',
                         tag: 'Lenna Lena' })

puts "photo_id = #{res['photo_id']}"
puts "url = #{res['url']}"
