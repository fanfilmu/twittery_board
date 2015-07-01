server "46.101.145.100", user: "deploy", roles: %w{app db web resque_worker resque_scheduler}

set :deploy_to, "/apps/twitter_board"
