module Sms::Request
  class Post < Base

    def perform_request
      connection.post { |request| params_of request }
    end

    def params_and_body(request)
      request.body = body unless body.blank?
    end

  end
end
