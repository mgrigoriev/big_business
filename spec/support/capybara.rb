# frozen_string_literal: true

require "selenium/webdriver"

Capybara.raise_server_errors = false
Capybara.javascript_driver = :selenium_chrome_headless
