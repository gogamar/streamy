# README

## Overview

The application handles movies, seasons, and episodes, letting users view and purchase content with different options. Purchased movies and seasons are stored in the user's library and can be watched for up to 2 days before they expire. The app includes a REST API for listing content, managing purchases, and accessing user libraries.

## Ruby Version

The application is built with Ruby version `3.1.2`.
ruby "3.1.2"

## System Dependencies

The following gems are required for the application:

- `jbuilder` - JSON builder for Rails.
- `redis` (>= 4.0.1) - Redis library for Ruby.
- `factory_bot_rails` - Fixtures replacement for Rails.
- `rspec-rails` (~> 6.1.4) - RSpec testing framework for Rails.
- `dotenv-rails` - Loads environment variables from `.env` files.

## Configuration

Redis Configuration

Make sure Redis is installed and running. Update your Redis URL in the .env file if necessary.

## Configuration

- Run `rails db:create` to create the database.
- Run `rails db:migrate` to migrate the database.
- Run `rails db:seed` to seed the database.

## How to run the tests

To run the tests, make sure you have RSpec and FactoryBot set up.
Then execute `bundle exec rspec`

## Services

Ensure Redis is configured and running.
