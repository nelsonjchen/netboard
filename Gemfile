source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  # Twitter Bootstrap
  gem 'less-rails-bootstrap', :git => "git://github.com/halves/less-rails-bootstrap.git", :branch => "2.0-wip"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
#


group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false

  # Mocha for testing
  gem 'mocha', :require => false   
  gem 'ruby-prof'
end

# Pry for better console
# Guard for autotest
group :development do
  gem 'guard'
  gem 'pry-rails'
  gem 'guard-test'
  gem 'rb-readline'
  gem 'ruby-prof'
  
  platforms :ruby do
    gem 'rb-readline'
  end
end
