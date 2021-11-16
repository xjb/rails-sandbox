require 'capybara'
require 'selenium-webdriver'

Capybara.disable_animation = true

Capybara.register_driver :remote_chrome do |app|
  args = %w[
    no-sandbox
    window-size=1680,1050
  ]
  args += %w[headless disable-gpu] if ActiveModel::Type::Boolean.new.cast(ENV.fetch('SELENIUM_HEADLESS', true))

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => { 'args' => args },
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: ENV['SELENIUM_HUB_URL'],
    capabilities: caps,
  )
end

RSpec.configure do |config|
  config.before :each, type: :system do
    # NOTE: js do not work.
    driven_by :rack_test
  end

  if ENV['SELENIUM_HUB_URL']
    config.before :each, type: :system, js: true do
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.app_host = "http://#{Capybara.server_host}"
      driven_by :remote_chrome
    end
  end
end
