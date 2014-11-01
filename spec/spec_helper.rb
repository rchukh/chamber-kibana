require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'support/matchers'

RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn
end

ChefSpec::Coverage.start!
