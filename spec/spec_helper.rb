require 'gempeace'
require 'gempeace/cli'

# # Requires supporting ruby files with custom matchers and macros, etc,
# # in spec/support/ and its subdirectories.
# Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
end
