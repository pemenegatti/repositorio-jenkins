# frozen_string_literal: true

require('capybara')
require('capybara/cucumber')
require('selenium-webdriver')
require('webdrivers')
require('site_prism')
require('allure-cucumber')

# case ENV['BROWSER']
# when 'firefox'
#   @driver = :selenium
# when
#   @driver = :selenium_chrome
# when 'headless'
#   Capybara.register_driver :selenium_chrome_headless do |app|
#     chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
#       options.add_argument '--headless'
#       options.add_argument '--disable-gpu'
#       options.add_argument '--no-sandbox'
#       options.add_argument '--disable-site-isolation-trials'
#     end
#     Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
#   end
#   @driver = :selenium_chrome_headless
# else
#   puts 'Ivalid browser'
# end

def chrome_options
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') if ENV['HEADLESS'].eql?('true')
  options.add_argument('disable-gpu')
  options
end

def firefox_options
  options = Selenium::WebDriver::Firefox::Options.new
  options.add_argument('--headless') if ENV['HEADLESS'].eql?('true')
  options
end

def register_driver(browser)
  Capybara.register_driver(:selenium) do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: browser.to_sym,
      options: __send__("#{browser}_options")
    )
  end
end

# Capybara.configure do |config|
#   config.default_driver = @driver
#   config.default_max_wait_time = 10
#   config.app_host = 'https://alexspalermo.github.io/AlexSPalermo.LoginCadastro.github.io'
#   Capybara.current_session.driver.browser.manage.window.maximize
# end

def capybara_config
  Capybara.configure do |capybara_config|
    capybara_config.default_driver = :selenium
    capybara_config.default_max_wait_time = 20
    capybara_config.javascript_driver = :selenium
    capybara_config.run_server = false
    capybara_config.app_host = 'https://alexspalermo.github.io/AlexSPalermo.LoginCadastro.github.io'
    Capybara.page.driver.browser.manage.window.maximize
  end
end

# Cucumber::Core::Test::Step.module_eval do
#   def name
#     return text if text == 'Before hook'
#     return text if text == 'After hook'
#     "#{source.last.keyword}#{text}"
#   end
# end

# class Cucumber::Core::Test::Step
#   def name
#     return text if self.text == 'Before hook'
#     return text if self.text == 'After hook'
#     "#{source.last.keyword}#{text}"
#   end 
# end

# AllureCucumber.configure do |config|
#   config.results_directory = "report/allure-results"
#   config.clean_results_directory = true
#   config.logging_level = Logger::INFO
#   config.logger = Logger.new($stdout, Logger::DEBUG)
#   config.environment = "staging"

#   # these are used for creating links to bugs or test cases where {} is replaced with keys of relevant items
#   config.link_tms_pattern = "http://www.jira.com/browse/{}"
#   config.link_issue_pattern = "http://www.jira.com/browse/{}"

#   # additional metadata
#   # environment.properties
#   config.environment_properties = {
#     custom_attribute: "foo"
#   }
#   # categories.json
#   config.categories = File.new("my_custom_categories.json")
# end

register_driver(ENV['BROWSER'])
capybara_config
