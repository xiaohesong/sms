module Sms
  class Error < RuntimeError; end
  class ConfigurationError < Error; end
  class NotImplementedError < Error; end
  class ArgumentError < Error; end
end
