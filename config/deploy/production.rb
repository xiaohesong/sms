role :app, %w{deploy@120.26.85.169}
role :web, %w{deploy@120.26.85.169}
role :db,  %w{deploy@120.26.85.169}

set :rvm_type, :system
set :rvm_ruby_version, '2.2.3'

set :rack_env, "production"
