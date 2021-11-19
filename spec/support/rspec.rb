RSpec.configure do |config|
  config.order = :random
  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.include ActiveSupport::Testing::TimeHelpers
end
