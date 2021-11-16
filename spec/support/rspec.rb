RSpec.configure do |config|
  config.order = :random

  config.include ActiveSupport::Testing::TimeHelpers
end
