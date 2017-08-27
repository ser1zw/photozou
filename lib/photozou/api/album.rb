require 'photozou/utils'
require 'photozou/album'

module Photozou
  module API
    module Album
      include Photozou::Utils

      # http://photozou.jp/basic/api_method_photo_album
      def photo_album
        albums = []
        res = get_json_with_credential('/photo_album.json')
        res['info']['album'].each { |album| albums << Photozou::Album.new(album) } if res['info']['album']
        albums
      end
    end
  end
end
