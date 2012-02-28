require 'capistrano/ext/multistage'
require 'capistrano_colors'

# cap deploy時にbundle installが実行される
require "bundler/capistrano"

set :application, "capistrano-sample"
set :repository,  "git+ssh://localhost/tmp/capistrano-sample"

# RVMを利用時の設定
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

set :scm, :git
set :user, 'takuro'
set :use_sudo, false 
default_run_options[:pty] = true

def restart_file
  File.join(current_path, 'tmp', 'restart.txt')
end

namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{restart_file}"
  end
end
