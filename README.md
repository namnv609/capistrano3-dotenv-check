# Capistrano3 Dotenv Check

Capistrano3 check .env variables

## Usage

### Setup

Add the library to your `Gemfile`

```Ruby
group :development do
  gem "capistrano3-dotenv-check", :require => false
end
```

Require in `Capfile` to use default task:

```ruby
require "capistrano3/dotenv-check"
```

## Configuration

Configurable options:

```ruby
set :dotenv_file_path, "#{shared_dir}/.env"   # this is default
set :dotenv_checklist, {}                     # this is default
```

You can set :dotenv_checklist and :dotenv_file_path in the stage which you want. Example:

```ruby
# config/deploy/staging.rb

set :dotenv_checklist, {
  ENV_KEY: "Expected value for staging",
  # ...
}
```

```ruby
# config/deploy/production.rb

set :dotenv_file_path, "/home/root/.env"
set :dotenv_checklist, {
  ENV_KEY: "Expected value for production"
}
```
