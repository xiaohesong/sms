module Sms::Request
  class Delete < Base

    def perform_request
      connection.delete { |request| params_of request }
    end

    def params_and_body(request)
      request.params = params if params.present?
    end

  end
end
