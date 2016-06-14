module Sms::Request
  class Head < Base

    def perform_request
      connection.head { |request| params_of request }
    end

    def params_and_body(request)
      request.params = params if params.present?
    end

  end
end
