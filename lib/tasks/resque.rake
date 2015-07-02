require "resque/tasks"
require "resque/scheduler/tasks"

namespace :resque do
  task setup: :environment do
    Resque.logger = Logger.new("log/resque-#{Rails.env}.log")
    Resque.logger.level = Logger::INFO
  end

  task setup_schedule: :setup do
    schedule = YAML.load_file(File.join(Rails.root, "config/resque_schedule.yml"))
    Resque.schedule = schedule if schedule
  end

  task scheduler: :setup_schedule
end
