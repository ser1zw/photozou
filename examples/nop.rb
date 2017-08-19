require 'photozou'

c = JSON.load(open(File.dirname(__FILE__) + '/credential.json', 'r'))
client = Photozou::Client.new(c['user_id'], c['password'])

ret = client.nop
puts "user_id = #{ret.user_id}"
