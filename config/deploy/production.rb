# -*- encoding : utf-8 -*-
set :rvm_ruby_string, 'ruby-2.1.2'
set :application, 'RSContent'
# set :branch, 'master'
set :branch, 'master'

role :web, '192.168.224.38' #primary rails app server
# role :app, '46.61.224.109' #sidekiq worker's and push server
role :app, '192.168.224.38' #sidekiq worker's and push server
role :db,  '192.168.224.38', :primary => true #db server

set :user,         'rs-mnt'
set :runner,        user
set :rails_env,     :production
set :deploy_env,    :production
set :default_env,   :production
set :deploy_to,     "/usr/local/www/html"
set :deploy_via,    :copy
#set :deploy_via,    :remote_cache
set :use_sudo,      false
set :keep_releases, 14

#set :default_environment, {
#    'PATH' => "/usr/local/rvm/gems/ruby-2.0.0-p353/bin:/usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-2.0.0-p353/bin:$PATH",
#    'RUBY_VERSION' => 'ruby-2.0.0-p353',
#    'GEM_HOME'     => '/usr/local/rvm/gems/ruby-2.0.0-p353',
#    'GEM_PATH'     => '/usr/local/rvm/gems/ruby-2.0.0-p353',
#    'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-2.0.0-p353'  # If you are using bundler.
#}


namespace :deploy do

  task :create_symlinks, :role => [:web, :app] do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    # run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end

  task :migrate, :roles => :web do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
  end

  task :seed, :roles => :web do
    run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake db:seed"
  end

  task :restart, :roles => :web, :except => { :no_release => true } do
    run "sh -c 'export pid=`cat #{current_path}/tmp/pids/unicorn.pid` && kill -USR2 $pid && sleep 60 && kill -9 $pid'"
    #run "touch #{release_path}/tmp/restart.txt"
  end


  namespace :assets do
    task :update_asset_mtimes, :roles => lambda { assets_role }, :except => { :no_release => true } do
    end

    task :clean_expired, :roles => lambda { assets_role }, :except => { :no_release => true } do
    end
  end

end

after  'deploy:update',  'deploy:cleanup'
after  'deploy:update',  'deploy:create_symlinks'
before 'deploy:finalize_update', 'deploy:create_symlinks'
after  'deploy:migrate', 'deploy:seed'

after 'deploy:restart', 'unicorn:stop'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:start'   # app preloaded
# after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented 
