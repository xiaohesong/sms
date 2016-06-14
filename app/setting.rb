class Setting < Settingslogic
  source "#{Sms::Application.root}/config/config.yml"
  namespace Sms::Application.env

  load! if Sms::Application.env == 'development'
end
