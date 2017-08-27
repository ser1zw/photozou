require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

# Get gruop information
client.user_group.each { |g|
  puts "gruop_id = #{g.group_id}"
  puts "name = #{g.name}"
  puts "user_num = #{g.user_num}"
  puts
}
