module Photozou
  class Error < StandardError
    attr_reader :code, :message

    def initialize(code, message)
      @code = code
      @message = message
    end

    def to_s
      "#{@code}: #{message}"
    end
  end
end
