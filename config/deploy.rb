# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'sms'
set :repo_url, 'git@gitlab.icar99.com:zc/sms.git'
set :deploy_to, "/var/www/sms"
set :scm, :git

set :linked_files, fetch(:linked_files, []).push('.ruby-version', 'config/config.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')
set :keep_releases, 5
set :deploy_via, :remote_cache
set :pty, true

set :sneakers_options, "WORKERS=Sms::Worker"

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      #invoke 'puma:restart'
      execute "echo restart"
    end
  end

  
  task :init_config_path do
    on roles(:app) do
      execute "mkdir -p #{deploy_to}/shared/config"
    end
  end

  before :starting,     :check_revision
  #after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
  after  :check,    :init_config_path
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
