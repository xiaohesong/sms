module Sms
  class << self
    extend Forwardable

    def_delegators :setting, :host, :username, :password

    def setting
      Setting
    end

    def publish(mobile, message)
      response = Sms::Request::Get.call(host, params: { mobile: mobile, sms: message.encode('gbk', 'utf-8') }.merge(account_params), headers: headers)
      Sneakers.logger.info  "#{response.message} mobile: #{mobile}; message: "
    end

    private

    def account_params
      { usr: username, pwd: password }
    end

    def headers
      {:content_type => 'application/x-www-form-urlencoded;charset=GBK'}
    end
  end
end

require 'forwardable'
