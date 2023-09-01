# Turbo Native example

This repo contains an example Turbo Native app for [Masilotti.com](https://masilotti.com). It purposely does very little – articles build on this to demonstrate how to use the framework.

* The `ios/` directory contains the Xcode project with a minimum Turbo Native integration.
* The `rails/` directory contains a companion Rails app with a single `Article` record.

## Getting started

First, setup and run the Rails server.

### Run the Rails server

Install the following:

* Ruby 3.2.2
* [postgresql](https://www.postgresql.org) - `brew install postgresql`
* [node](https://nodejs.org/en/) - `brew install node`
* [Yarn](https://yarnpkg.com) - `brew install yarn`

Then, run the setup script and start the server.

1. `bin/setup`
1. `bin/dev`

### Run the iOS app

Once the server is running you can start the iOS app.

1. Download and install Xcode from the [App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
1. Open `ios/Turbo Native Example.xcodeproj`
1. Run the app via Product → Run in Xcode
