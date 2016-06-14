require 'json'

module Sms
  class Parser
    def initialize(msg)
      msg = JSON.parse(msg)
      @recipient_list = Sms::RecipientList.new(msg['mobile'])
      @message = msg['message']
    rescue
      raise Sms::ArgumentError.new("ArgumentError: 传递的参数非法，必须是json格式")
    end

    def message
      @message
    end

    def mobile
      @recipient_list.to_s
    end
  end
end
