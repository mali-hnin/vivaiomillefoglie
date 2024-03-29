# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "vivaiomillefoglie"
set :repo_url, "git@github.com:mali-hnin/vivaiomillefoglie.git"

# rbenv
set :rbenv_type, :user
set :rbenv_Ruby, '2.5.3'

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

set :deploy_via, :remote_cache

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', "public/packs", "node_modules"

# Only keep the last 5 releases to save disk space
set :keep_releases, 3

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
before "deploy:symlink:release", "deploy:ensure_bin_files_executable"

namespace :deploy do
  desc 'Ensure that bin files are executable'
  task :ensure_bin_files_executable do
    on roles(:web) do
      within release_path do
        execute "cd #{release_path} && chmod +x bin/*"
      end
    end
  end
end
