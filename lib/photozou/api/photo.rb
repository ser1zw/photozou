require 'photozou/utils'
require 'photozou/photo'

module Photozou
  module API
    module Photo
      include Photozou::Utils

      # http://photozou.jp/basic/api_method_photo_info
      def photo_info(photo_id, option = { private: true })
        option['photo_id'] = photo_id
        res = get_json_with_credential('/photo_info.json', option)
        Photozou::Photo.new(res['info']['photo'])
      end

      # http://photozou.jp/basic/api_method_photo_album_photo
      def photo_album_photo(album_id, option = {})
        option['album_id'] = album_id
        res = get_json_with_credential('/photo_album_photo.json', option)
        photos = res['info']['photo'] || []

        photos.map { |photo| Photozou::Photo.new(photo) }
      end

      # http://photozou.jp/basic/api_method_photo_add
      def photo_add(album_id, photo, content_type, option = {})
        option['album_id'] = album_id
        option['photo'] = [ photo, { 'Content-Type': content_type } ]
        res = post_multipart_with_credential('/photo_add.json', option)
      end

      # http://photozou.jp/basic/api_method_photo_delete
      def photo_delete(photo_id)
        res = post_with_credential('/photo_delete.json', { 'photo_id': photo_id })
      end
    end
  end
end
