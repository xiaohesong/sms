module Sms::Request
  class Patch < Base

    def perform_request
      connection.patch { |request| params_of request }
    end

    def params_and_body(request)
      request.body = body unless body.blank?
    end

  end
end
