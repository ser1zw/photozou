module Photozou
  class Base
    def initialize(attrs = {})
      @attrs = attrs || {}
      @attrs.keys.each { |key|
        self.class.send(:define_method, key) {
          @attrs[key]
        }
      }
    end

    def override(attr_name, &block)
      @attrs[attr_name] = block.call(@attrs[attr_name])
    end
  end
end
