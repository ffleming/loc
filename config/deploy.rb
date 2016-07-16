lock '3.4.0'

set :application, 'loc'
set :repo_url, 'git@github.com:ffleming/loc.git'
set :deploy_to, '/var/www/loc'
set :scm, :git
set :format, :pretty
set :log_level, :info
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :passenger_restart_with_touch, false
set :passenger_in_gemfile, true
