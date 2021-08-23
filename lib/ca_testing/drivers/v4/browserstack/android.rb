# frozen_string_literal: true

module CaTesting
  module Drivers
    module V4
      module Browserstack
        class Android
          class << self
            # @return [Hash]
            #
            # Returns the Specific Nested Browserstack capabilities for a W3C-compliant Android Driver
            def capabilities
              {
                "bstack:options" => {
                  "osVersion" => "10.0",
                  "deviceName" => "Samsung Galaxy S20",
                  "realMobile" => "true",
                  "appiumVersion" => "1.17.0"
                }
              }
            end
          end
        end
      end
    end
  end
end
