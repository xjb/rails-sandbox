module RSpecHelpers
  module SignInHelper
    def sign_in(user: nil); end
  end
end

RSpec.configure do |config|
  config.include RSpecHelpers::SignInHelper
end
