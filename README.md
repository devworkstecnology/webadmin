[![Build Status](https://semaphoreci.com/api/v1/projects/c7dbc9ee-0349-420d-8899-43c3efd0b587/509165/badge.svg)](https://semaphoreci.com/rodrigoulisses/webadmin)

= WebAdmin

## Getting started

WebAdmin 0.1.0 works with Rails 4.1.8 onwards. You can add it to your Gemfile with:

```ruby
gem 'web_admin'
```

Run the bundle command to install it.

After you install WebAdmin and add it to your Gemfile, add routes to WebAdmin in config/routes.rb with

```ruby
mount WebAdmin::Engine, at: 'admin'
```

Then need to copy the migration with:

```console
rake web_admin:install:migrations
```
