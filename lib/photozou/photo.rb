require 'date'
require 'photozou/base'

module Photozou
  class Photo < Base
    def initialize(attrs)
      super attrs

      override('date') { |a| a && Date.parse(a) }
      override('regist_time') { |a| DateTime.parse(a) }
      override('geo') { |a| a && Geo.new(a) }
    end

    class Geo < Base
    end
  end
end
