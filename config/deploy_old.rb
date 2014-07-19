module GitStrategy
  require 'capistrano/git'
  include Capistrano::Git::DefaultStrategy
  def release
    git :archive, fetch(:branch), '| tar -x -f - -C', release_path
  end
end

set :git_strategy, GitStrategy
# config valid only for Capistrano 3.1
lock '3.2.1'
# '2.1.2'

set :application, 'RSContent'

set :rails_env, "production"

set :scm, :git
set :repo_url, 'git@git.orfogr.ru:gr/rs-content.git'
set :branch, 'master'

set :user, 'rs-mnt'
set :deploy_to, '/usr/local/www/html'
set :use_sudo, false

set :deploy_via, :copy
set :ssh_options, { :forward_agent => true }

server "192.168.224.38", user: 'rs-mnt', roles: [:app, :web, :db], :primary => true

set :keep_releases, 4

# set :bundle_without, [:development, :test]


# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
desc "Check vars"
task :check_vars do
  on roles(:all) do |host|
    p "#{ rails_env }"
    p "#{ sudo }"
  end
end

desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end

# lib/capistrano/tasks/agent_forwarding.rake
desc "Check if agent forwarding is working"
task :forwarding do
  on roles(:all) do |h|
    if test("env | grep SSH_AUTH_SOCK")
      info "Agent forwarding is up to #{h}"
    else
      error "Agent forwarding is NOT up to #{h}"
    end
  end
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  

  desc "Symlink shared config files"
  task :symlink_config_files do
    # run "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end

  # NOTE: I don't use this anymore, but this is how I used to do it.


  desc "Restart applicaiton"
  task :restart do
    # run "touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
  end
end
# after 'deploy:update', 'bundle:install'
# after 'deploy:restart', 'unicorn:stop'

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"

