source 'https://rubygems.org'

# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', :github => "spree/spree_auth_devise", :branch => '2-0-stable'

gemspec

group :test do
  gem "shoulda-matchers"
end

# `rspec-rails` needs to be in the development group so that Rails generators work.
group :development, :test do
  gem "rspec-rails", "~> 2.12"
end

gem 'therubyracer'
