source 'https://ruby.taobao.org'

group :development do
  gem 'capistrano', '~> 3.3.0'
  gem 'rack-handlers'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-sneakers', git: 'git@gitlab.icar99.com:zc/capistrano-sneakers.git', tag: 'v0.0.4', require: false
  gem 'capistrano-logrotate', git: 'git@gitlab.icar99.com:zc/capistrano-logrotate.git', tag: 'v0.0.1', require: false
  gem 'pry', "~> 0.9.12"
  gem 'pry-nav', "~> 0.2.3"
end

group :development, :test do
  gem "guard"
  gem "guard-bundler"
  gem "guard-rack"
  gem 'guard-spork'
  gem 'guard-rspec'
  gem "factory_girl", "~> 4.0"
end

group :test do
  gem 'rspec', '~> 3.2.0'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'ffi'
  gem 'rb-fsevent'
  # brew install terminal-notifier
  gem 'terminal-notifier-guard'

end

gem 'activesupport'

gem 'rake'

# Yaml 配置信息
gem 'settingslogic', '~> 2.0.9'

gem 'sneakers'

gem 'foreman'

gem 'faraday'
gem 'typhoeus'
