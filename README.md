[![Build Status](https://semaphoreci.com/api/v1/projects/c7dbc9ee-0349-420d-8899-43c3efd0b587/509165/badge.svg)](https://semaphoreci.com/rodrigoulisses/webadmin)
[![Code Climate](https://codeclimate.com/github/devworkstecnology/webadmin/badges/gpa.svg)](https://codeclimate.com/github/devworkstecnology/webadmin)

# WebAdmin

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

Load the WebAdmin seeds from your seeds.rb:

```ruby
WebAdmin::Engine.load_seed
```

Then need to copy the migration with:

```console
rake web_admin:install:migrations
```

Run database seeder:

```console
rake db:seed
```

The default user is: admin@email.com:pwd12345

Create file config/images.yml in your application with

```yaml
uploaders:
  post:
    thumb_admin:
      width: 50
    thumb_site:
      width: 50
  event:
    thumb_admin:
      width: 50
    thumb_site:
      width: 50
  image:
    thumb_admin:
      width: 50
    thumb_site:
      width: 50
```
