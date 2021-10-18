# validate_ipa plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-validate_ipa)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-validate_ipa`, add it to your project by running:

```bash
fastlane add_plugin validate_ipa
```

## About validate_ipa

Validate the IPA using altool. Improved the [validate_app](https://github.com/fastlane-community/fastlane-plugin-validate_app) plugin, which is no longer maintained. If your Apple ID is using Two-factor authentication, you will need to pass an app-specific password.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`. 

```ruby
lane :test do
  errors = validate_ipa(
    path: "result/test.ipa",
    platform: "ios",
    username: "username",
    password: "password" 
  )
  
  if errors.nil?
    upload_to_appstore
  end
end
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
