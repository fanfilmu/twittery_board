source "https://rubygems.org"


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.2.1"

gem "puma"
gem "pg"
gem "haml"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"

gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc

gem "bootstrap-sass"
gem "font-awesome-sass"

gem "devise"
gem "omniauth"
gem "omniauth-twitter"
gem "twitter"

gem "rails_12factor", group: :production

gem "resque"
gem "resque-scheduler"

group :development, :test do
  gem "rspec-rails", "~> 3.0"
  gem "pry"
  gem "pry-byebug"

  gem "web-console", "~> 2.0"
  gem "spring"
  gem "dotenv-rails"
end

group :development do
  gem "capistrano-rails",            require: false
  gem "capistrano-bundler",          require: false
  gem "capistrano3-puma",            require: false
  gem "capistrano-rbenv",            require: false
  gem "capistrano-resque", "=0.2.1", require: false

  gem "rails-erd"
end

group :test do
  gem "shoulda-matchers"
  gem "simplecov"
  gem "fabrication"
  gem "faker"
  gem "vcr"
  gem "webmock"
  gem "capybara"
end
