source 'https://rubygems.org'

ruby '3.1.0' # Specify your desired Ruby version

gem 'listen', '~> 3.8'
gem 'perlin_noise', '~> 0.1.3'
gem 'rails', '6.1.4' # Specify the desired Rails version
gem 'rmagick', '~> 5.3'
gem 'rswag-api'
gem 'rswag-ui'
gem 'webrick', '~> 1.8'

# Add other gems your project depends on
gem 'bcrypt' # Password hashing
gem 'devise' # Authentication
gem 'dotenv-rails' # Environment variable management
gem 'matrix'
gem 'pg' # PostgreSQL database adapter
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'webpacker' # JavaScript asset management
gem 'hornetseye-openexr', '~> 1.0'

# Group gems for development and testing
group :development, :test do
  gem 'byebug' # Debugging tool
  gem 'factory_bot_rails' # Test data creation
  gem 'rspec-rails' # Testing framework
  gem 'rswag-specs'
  gem 'sqlite3' # Use a development database like SQLite
end

group :development, :production do
  gem 'bootsnap', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
