# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'webdrivers'
require 'site_prism'

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when
  @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument "--headless"
      options.add_argument "--disable-gpu"
      options.add_argument "--no-sandbox"
      options.add_argument "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  puts "Ivalid browser"
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.default_max_wait_time = 10
  config.app_host = 'https://alexspalermo.github.io/AlexSPalermo.LoginCadastro.github.io'
  Capybara.current_session.driver.browser.manage.window.maximize
end
