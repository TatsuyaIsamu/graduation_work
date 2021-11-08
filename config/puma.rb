threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
threads threads_count, threads_count

pidfile ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }

# 開発環境
# environment ENV.fetch("RAILS_ENV") { "development" }
port        ENV.fetch('PORT') { 3000 }

# 本番環境時
environment ENV.fetch('RAILS_ENV') { 'production' }

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# ローカル使用の際は以下をコメントアウト
# app_root = File.expand_path("../..", __FILE__)
# bind "unix://#{app_root}/tmp/sockets/puma.sock"

# stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true
