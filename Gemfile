source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "pg"
gem "rails", "~> 5.2.0"
gem "puma", "~> 3.11"
gem "devise"
gem "draper"
gem "haml-rails"
gem "jquery-rails"
gem "bootstrap-sass"
gem "sass-rails"
gem "sqlite3"
gem "uglifier"
gem "overcommit"
gem "rubocop"
gem "scss_lint", require: false
gem "turbolinks", "~> 5.1.0"
gem "coffee-rails"
gem "image_optim"
gem "image_optim_pack"
gem "font-awesome-rails"
gem "rest-client"
gem "omniauth"
gem "omniauth-slack", git: "https://github.com/ginjo/omniauth-slack.git", branch: "features-and-fixes-rebased"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "listen"
  gem "rspec-rails"
  gem "simplecov"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "spring"
  gem "spring-commands-rspec"
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
end
