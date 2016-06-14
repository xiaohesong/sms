module Sms
  class RecipientList
    def initialize(recipient)
      @recipient = case recipient
                   when String
                     recipient.split(',')
                   when Array
                     recipient
                   else
                     raise Sms::ArgumentError.new("ArgumentError: 手机号码#{recipient.inspect}非法")
                   end
    end

    def to_s
      raise Sms::ArgumentError.new("ArgumentError: 手机号码#{invalid}非法") unless valid.present?
      valid
    end

    private

    def valid
      @recipient.select {|x| x =~ /^1\d{10}$/}.join(",")
    end

    def invalid
      @recipient.reject {|x| x =~ /^1\d{10}$/}.join(",")
    end
  end
end
