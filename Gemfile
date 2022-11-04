source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'jwt'
gem 'figaro', '~> 1.1', '>= 1.1.1'

gem 'searchkick'
gem 'elasticsearch', '< 7.13'
gem 'bonsai-searchkick'
# gem 'elasticsearch-api', '~> 7.13'
# gem 'elastic-transport', '~> 7.13'

gem 'will_paginate', '~> 3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0', '>= 7.0.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4', '>= 1.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '~> 1.13', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring', '~> 4.1'
  gem 'awesome_print'
  gem 'pry', '~> 0.14.1', require: false
  gem 'require-prof', '~> 0.0.1', require: false
  gem 'rspec', '~> 3.12', require: false
  gem 'ruby-prof', '~> 1.4', '>= 1.4.3', require: false
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'webmock', '~> 3.18', '>= 3.18.1', require: false
  gem 'yard', '~> 0.9.28', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
