module Sms
  class Response
    STATE = {
      success: 0,
      system: -100,
      auth: -101,
      phone_length: -102,
      message_blank: -103,
      remaining_balance: -104,
      phone_format: -105,
      ip: -106,
      message_dup: -107,
      phone_not_enough: -108
    }

    STATE_MESSAGE = {
      success: "发送成功",
      system: "系统错误",
      auth: "用户名或密码错误",
      phone_length: "手机号码串长度非法",
      message_blank: "短信为空",
      remaining_balance: "授权余额不足",
      phone_format: "手机号码格式不正确",
      ip: "ip地址未绑定",
      message_dup: "同一手机号码相同内容重复提交",
      phone_not_enough: "每个短信包手机号码数少于20个"
    }

    def initialize(body)
      @status = body.split(",")[0].to_i
      @message_id = body.split(",")[1]
    end

    def message
      STATE_MESSAGE[status]
    end

    def success?
      @status == success
    end

    private

    def success
      STATE[:success]
    end

    def status
      STATE.invert[@status]
    end

    def message_id
      @message_id
    end

  end
end
