module Sms::Request
  class Put < Base

    def perform_request
      connection.put { |request| params_of request }
    end

    def params_and_body(request)
      request.body = body unless body.blank?
    end

  end
end
