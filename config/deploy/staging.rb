role :app, %w{deploy@114.215.208.110}
role :web, %w{deploy@114.215.208.110}
role :db,  %w{deploy@114.215.208.110}

set :rvm_type, :system
set :rvm_ruby_version, '2.2.2'

set :rack_env, "staging"
