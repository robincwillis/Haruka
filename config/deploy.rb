#set :stages, %w(production staging)
#set :default_stage, "production"
#require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :application, "Haruka"
set :repository,  "git@github.com:robincwillis/Haruka.git"
set :branch, "master"
#set :deploy_via, :remote_cache
set :scm, :git


set :use_sudo, false
set :deploy_to, "/home/haruka/"
set :user, "haruka"
ssh_options[:keys] = ["#{ENV['HOME']}/.ec2/ec2-keypair.pem"]
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

#role :web, "54.235.165.113"                          # Your HTTP server, Apache/etc
server "ec2-54-235-165-113.compute-1.amazonaws.com",:app, :web, :db, :primary => true 
# This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:update', 'db:db_config'
after 'deploy', 'deploy:precompile'
after 'deploy', 'deploy:cleanup'
after 'deploy', 'deploy:migrate'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "cp -f /home/haruka/database.yml #{latest_release}/config/database.yml"
  end
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :precompile, :role => :app do
    run "cd #{release_path}/ && rake assets:precompile"
  end
end