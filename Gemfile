source 'https://rubygems.org'

group :test do
  gem 'coveralls'
  gem 'rspec', '>= 2.14'
  gem 'simplecov', '>= 0.9'
  gem 'rubocop', '>= 0.27'
  gem 'yardstick'
  if RUBY_VERSION >= '1.9.3'
    gem 'guard', '~> 2.6'
    gem 'guard-rspec', '~> 4.2'
  end
  gem 'webmock'
  gem 'codeclimate-test-reporter', group: :test, require: nil
end

# Specify your gem's dependencies in flood.gemspec
gemspec
