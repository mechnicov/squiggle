source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.3'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'pg', '>= 0.18', '< 2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.6.0'
gem 'devise-i18n'
gem 'carrierwave', '~> 1.0'
gem 'rmagick'
gem 'fog-aws'
gem 'rails_admin', '~> 1.3'
gem 'rails_admin-i18n'
gem 'rails_admin_nestable', '~> 0.3.2'
gem 'rails_admin_toggleable'
gem 'friendly_id', '~> 5.2.4'
gem 'babosa'
gem 'ancestry'
gem 'acts_as_list'
gem 'haml-rails', '~> 1.0'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'faker'
gem 'recaptcha'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'letter_opener'
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-rails', '~> 1.3.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.4.0'
end

group :test do
  gem 'rspec-rails', '~> 3.8.0'
  gem 'factory_bot_rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'capybara', '~> 3.16.0'
  gem 'launchy'
end
