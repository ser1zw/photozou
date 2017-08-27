require 'photozou/utils'
require 'photozou/group'

module Photozou
  module API
    module Group
      include Photozou::Utils

      # http://photozou.jp/basic/api_method_user_group
      def user_group
        res = get_json_with_credential('/user_group.json')
        groups = res['info']['user_group'] || []
        groups.map { |g| Photozou::Group.new(g) }
      end
    end
  end
end
