require 'uri'
require 'net/http'
require 'json'

require 'photozou/api/nop'
require 'photozou/api/album'
require 'photozou/api/photo'
require 'photozou/api/user'

require 'photozou/utils'
require 'photozou/info'
require 'photozou/album'
require 'photozou/photo'
require 'photozou/user'
require 'photozou/error'

module Photozou
  class Client
    include Photozou::API::Nop
    include Photozou::API::Album
    include Photozou::API::Photo
    include Photozou::API::User

    attr_reader :login_id, :password

    def initialize(login_id, password)
      @login_id = login_id
      @password = password
    end

    # http://photozou.jp/basic/api_method_user_info
    def self.user_info(user_id)
      Photozou::API::User.user_info(user_id)
    end
  end
end
