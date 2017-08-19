require 'photozou/utils'

module Photozou
  module Api
    module Nop
      include Photozou::Utils

      # http://photozou.jp/basic/api_method_nop
      def nop
        res = get_json_with_credential('/nop.json')
        Photozou::Info.new(res['info'])
      end
    end
  end
end
