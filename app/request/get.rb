module Sms::Request
  class Get < Base

    def perform_request
      connection.get { |request| params_of request }
    end

    def params_and_body(request)
      request.params = params if params.present?
    end

  end
end
