#========================
#CONFIG
#========================

#We're using RVM on the server:
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require 'rvm/capistrano'
# set :rvm_ruby_string, '1.9.3'
# set :rvm_type, :user
# now use gem 'rvm-capistrano'
# set :default_environment, {
#       'PATH' => "/home/webmaster/.rvm/rubies/ruby-1.9.3-p429/bin/ruby:$PATH"
#     }

set :application, "JCA_Sinatra_1"

#We're using puma
require 'puma/capistrano'
 
set :scm, :git
set :git_enable_submodules, 1
default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :repository, "git://github.com/rebelwarrior/JCA_Sinatra_1.git"  # Your clone URL
# set :repository, "file://Users/davidacevedo/Code/JCA_1/JCA_Sinatra/"  # Your clone URL
# set :local_repository, "file://."
set :branch, "master"
set :ssh_options, { :forward_agent => true }
 
set :stage, :production
set :user, "webmaster"
set :use_sudo, false
set :runner, "webmaster"
set :deploy_to, "/data/apps/#{stage}/#{application}"
set :app_server, :passenger
set :domain, "198.61.202.168"
 
#========================
#ROLES
#========================
role :app, domain
role :web, domain
role :db, domain, :primary => true

#========================
#CUSTOM
#========================
 
# Capistrano::Configuration.instance.load do
  after 'deploy:stop', 'puma:stop'
  after 'deploy:start', 'puma:start'
  after 'deploy:restart', 'puma:restart'

  # Ensure the tmp/sockets directory is created by the deploy:setup task and
  # symlinked in by the deploy:update task. This is not handled by Capistrano
  # v2 but is fixed in v3.
  shared_children.push('tmp/sockets')

  _cset(:puma_cmd) { "#{fetch(:bundle_cmd, 'bundle')} exec puma" }
  _cset(:pumactl_cmd) { "#{fetch(:bundle_cmd, 'bundle')} exec pumactl" }
  _cset(:puma_state) { "#{shared_path}/sockets/puma.state" }
  _cset(:puma_role) { :app }

  namespace :puma do
    desc 'Start puma'
    task :start, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
      puma_env = fetch(:rack_env, fetch(:rails_env, 'production'))
      run "cd #{current_path} && #{fetch(:puma_cmd)} -q -d -e #{puma_env} -b 'unix://#{shared_path}/sockets/puma.sock' -S #{fetch(:puma_state)} --control 'unix://#{shared_path}/sockets/pumactl.sock'", :pty => false
    end

    desc 'Stop puma'
    task :stop, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
      run "cd #{current_path} && #{fetch(:pumactl_cmd)} -S #{fetch(:puma_state)} stop"
    end

    desc 'Restart puma'
    task :restart, :roles => lambda { fetch(:puma_role) }, :on_no_matching_servers => :continue do
      run "cd #{current_path} && #{fetch(:pumactl_cmd)} -S #{fetch(:puma_state)} restart"
    end
  end
# end