require 'fastlane/action'
require_relative '../helper/validate_ipa_helper'

module Fastlane
  module Actions
    class ValidateIpaAction < Action
      def self.run(params)
        UI.message "Start IPA validation."

        command = ["xcrun", " altool"]
        command << "--validate-app"
        command << "--file"
        command << params[:path]
        command << "--type"
        command << params[:platform]
        command << "--username"
        command << params[:username]
        command << "--password"
        command << params[:password]
        command << "--output-format xml"
        command << "| tr -d '\n'"
        
        result = sh(command.join(" "))
        plist = Plist.parse_xml(result)
        errors = plist["product-errors"]

        if errors.nil?
          UI.success("IPA validation success => " + plist["success-message"])
          return nil
        else
          reason = errors
            .each_with_index
            .map { |error, index| "Reason #{index + 1} : #{error["userInfo"]["NSLocalizedFailureReason"]}" }
            .join(" ")
          UI.error("IPA validation failure => " + reason)
          UI.user_error!("IPA validation failure.")
          return errors
        end
      end

      def self.description
        "Validate the IPA using altool."
      end

      def self.authors
        ["hacoma"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "FL_VALIDATE_IPA_PATH",
                                       description: "IPA Path",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Path is not valid.") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :platform,
                                       env_name: "FL_VALIDATE_IPA_PLATFORM",
                                       description: "IPA Platform",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Platform is not valid.") unless (value and not value.empty?)
                                         platform = %w(ios macos)
                                         UI.user_error!("Unsupported platform. (Supported platforms : #{platform})") unless platform.include?(value)
                                       end),
          FastlaneCore::ConfigItem.new(key: :username,
                                       env_name: "FL_VALIDATE_IPA_USERNAME",
                                       description: "Apple ID",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Apple ID is not valid.") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :password,
                                       env_name: "FL_VALIDATE_IPA_PASSWORD",
                                       description: "Apple ID or App-specific password",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Apple ID or App-specific password is not valid.") unless (value and not value.empty?)
                                       end)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end
    end
  end
end
