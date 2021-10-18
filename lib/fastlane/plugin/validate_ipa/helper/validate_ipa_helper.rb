require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class ValidateIpaHelper
      # class methods that you define here become available in your action
      # as `Helper::ValidateIpaHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the validate_ipa plugin helper!")
      end
    end
  end
end
