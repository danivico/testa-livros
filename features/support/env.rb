require 'capybara'
require 'cucumber'
require 'capybara/rspec'
require "selenium-webdriver"
require "site_prism"
require 'capybara/cucumber'
require 'rspec'


Capybara.configure do |config|
    config.default_driver = :selenium_chrome
  end