require 'uri'
require 'net/http'
require 'json'

require 'photozou/error'

module Photozou
  module Utils
    REST_URL = 'https://api.photozou.jp/rest'

    module_function

    def get_json(path, option = {}, credentials = {})
      uri = URI.parse(REST_URL + path)
      uri.query = URI.encode_www_form(option) if option.size > 0

      request = Net::HTTP::Get.new(uri)
      request.basic_auth(credentials[:login_id], credentials[:password]) if credentials.size > 0

      response = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == 'https')) { |http|
        http.request(request)
      }

      json = JSON.parse(response.body)
      if json['stat'] == 'fail'
        error = json['err'].first # FIXME: API may return multiple errors, but only 1 error is supported for now
        raise Photozou::Error.new(error['code'], error['msg'])
      end

      json
    end

    def post(path, data = {}, credentials = {})
      uri = URI.parse(REST_URL + path)

      request = Net::HTTP::Post.new(uri)
      request.set_form_data(data)
      request.basic_auth(credentials[:login_id], credentials[:password]) if credentials.size > 0

      response = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == 'https')) { |http|
        http.request(request)
      }

      json = JSON.parse(response.body)
      if json['stat'] == 'fail'
        error = json['err'].first # FIXME: API may return multiple errors, but only 1 error is supported for now
        raise Photozou::Error.new(error['code'], error['msg'])
      end

      json
    end

    def post_multipart(path, data = {}, credentials = {})
      uri = URI.parse(REST_URL + path)

      request = Net::HTTP::Post.new(uri)
      data = data.map { |k, v| [k.to_s, v].flatten }
      request.set_form(data, 'multipart/form-data')
      request.basic_auth(credentials[:login_id], credentials[:password]) if credentials.size > 0

      response = Net::HTTP.start(uri.host, uri.port, use_ssl: (uri.scheme == 'https')) { |http|
        http.request(request)
      }

      json = JSON.parse(response.body)
      if json['stat'] == 'fail'
        error = json['err'].first # FIXME: API may return multiple errors, but only 1 error is supported for now
        raise Photozou::Error.new(error['code'], error['msg'])
      end

      json
    end

    def get_json_with_credential(path, option = {})
      Utils.get_json(path, option, { login_id: @login_id, password: @password })
    end

    def post_multipart_with_credential(path, form_data = {})
      Utils.post_multipart(path, form_data, { login_id: @login_id, password: @password })
    end

    def post_with_credential(path, form_data = {})
      Utils.post(path, form_data, { login_id: @login_id, password: @password })
    end
  end
end
