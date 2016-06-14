require 'sneakers'
require 'sneakers/metrics/logging_metrics'

log = "#{Sms::Application.root}/log/sneakers.log"
pid = "#{Sms::Application.root}/tmp/pids/sneakers.pid"

Sneakers.configure(Setting.sneakers.symbolize_keys.merge(metrics: Sneakers::Metrics::LoggingMetrics.new, log: log, pid_path: pid))
Sneakers.logger.level = Logger::INFO
