source 'https://rubygems.org'

gem 'chef'
gem 'rake'
gem 'stove'
gem 'berkshelf'

group :lint do
  gem 'foodcritic', '4.0'
  gem 'rubocop',    '0.27'
end

group :unit do
  gem 'chef-sugar',  '~> 2.4'
  gem 'fuubar'
  gem 'chefspec',  '4.1.1'
end

group :integration do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'busser-bats'
  gem 'busser-minitest'
end
