# config valid only for current version of Capistrano
lock "3.4.0"

set :application, "twittery_board"
set :repo_url, "git@github.com:fanfilmu/twittery_board.git"

set :branch, ENV["BRANCH_NAME"] || :master

set :linked_files, fetch(:linked_files, []).push(".env", "config/database.yml", "config/secrets.yml")
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets")

set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rbenv_type, :user
set :rbenv_ruby, "2.2.2"

set :resque_environment_task, true
