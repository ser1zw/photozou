require 'photozou/utils'
require 'photozou/user'

module Photozou
  module Api
    module User
      include Photozou::Utils

      # http://photozou.jp/basic/api_method_user_info
      def self.user_info(user_id)
        res = Utils.get_json('/user_info.json', { user_id: user_id })
        Photozou::User.new(res['info']['user'])
      end
    end
  end
end
