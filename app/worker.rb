module Sms
  class Worker
    include Sneakers::Worker
    from_queue 'zcq.sms', threads: 10, prefetch: 10

    def work(msg)
      begin
        params = Sms::Parser.new(msg)
        Sms.publish(params.mobile, params.message)
        ack!
      rescue Sms::ArgumentError => e
        logger.error e.message
        ack!
      rescue => e
        logger.error e.message + "\n" + e.backtrace.join("\n")
        ack!
      end
    end
  end
end
