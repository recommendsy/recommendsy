require 'bundler/capistrano' # for bundler support

set :application, "recommendsy"
set :repository,  "git@github.com:recommendsy/recommendsy.git"

set :user, 'flatiron'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

role :web, "107.170.136.214"                          # Your HTTP server, Apache/etc
role :app, "107.170.136.214"                          # This may be the same as your `Web` server

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
after "deploy:finalize_update","deploy:config_symlink"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

   task :config_symlink do
    # run "cp #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "cp #{shared_path}/application.yml #{release_path}/config/application.yml"
  end

end