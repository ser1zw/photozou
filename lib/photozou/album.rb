require 'date'
require 'photozou/base'

module Photozou
  class Album < Base
    def initialize(attrs)
      super attrs

      ['created_time', 'updated_time'].each { |m|
        override(m) { |a| DateTime.parse(a) }
      }
    end
  end
end
