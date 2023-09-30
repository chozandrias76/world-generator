source 'https://rubygems.org'

ruby '3.1.0' # Specify your desired Ruby version

gem 'rails', '6.1.4' # Specify the desired Rails version
gem "webrick", "~> 1.8"
gem 'listen', '~> 3.8'
gem 'rswag-api'
gem 'rswag-ui'

# Add other gems your project depends on
gem 'pg' # PostgreSQL database adapter
gem 'devise' # Authentication
gem 'bcrypt' # Password hashing
gem 'dotenv-rails' # Environment variable management
gem 'webpacker' # JavaScript asset management
gem 'rack-cors'

# Group gems for development and testing
group :development, :test do
  gem 'sqlite3' # Use a development database like SQLite
  gem 'byebug' # Debugging tool
  gem 'rspec-rails' # Testing framework
  gem 'rswag-specs'
  gem 'factory_bot_rails' # Test data creation
end

group :development, :production do
  gem 'bootsnap', require: false
end
