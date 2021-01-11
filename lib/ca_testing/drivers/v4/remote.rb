# frozen_string_literal: true

require "ca_testing/drivers/v4/options"

module CaTesting
  module Drivers
    module V4
      class Local
        def register
          Capybara.register_driver :selenium do |app|
            Capybara::Selenium::Driver.new(
              app,
              browser: :remote,
              capabilities: [browser_capabilities, options],
              url: hub_url
            )
          end
        end

        private

        def browser_capabilities
          case browser
          when :chrome;            then Selenium::WebDriver::Remote::Capabilities.chrome
          when :firefox;           then Selenium::WebDriver::Remote::Capabilities.firefox
          when :internet_explorer; then Selenium::WebDriver::Remote::Capabilities.internet_explorer
          else                     raise StandardError, "Not implemented"
          end
        end
      end
    end
  end
end
