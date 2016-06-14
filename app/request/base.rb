require 'active_support/core_ext/object/blank.rb'

module Sms
  module Request
    class Base
      include Sms::Connection

      FIELDS = %W{params headers body}

      attr_reader *(FIELDS + [:path])

      def initialize(path, options = {})
        @path = path
        FIELDS.each do |field|
          instance_variable_set("@#{field}", options[field.to_sym])
        end
      end

      def call
        Sms::Response.new(perform_request.body)
      end

      def self.call(path, options = {})
        self.new(path, options).call
      end

      private

      def params_of(request)
        url_and_headers request
        params_and_body request
      end

      def url_and_headers(request)
        request.url path
        request.headers.merge!(headers)
      end

    end
  end
end
