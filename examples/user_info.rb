require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get user_id
res = client.nop

# Get user information
user = Photozou::Client.user_info(res.user_id)

puts "user_id = #{user.user_id}"
puts "nick_name = #{user.nick_name}"
puts "photo_num = #{user.photo_num}"
puts "profile_url = #{user.profile_url}"
