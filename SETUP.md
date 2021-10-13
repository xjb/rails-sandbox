# SETUP

## Getting Started

1. Create docker-compose.yml

docker-compose.yml
```yml
version: "3.9"
services:
  ap:
    image: ghcr.io/xjb/rails:main
    ports:
      - "3000:3000"
    volumes:
      - .:/workspace
      - node_modules:/workspace/node_modules
    tty: true
    stdin_open: true

volumes:
  node_modules:
```

2. Create Gemfile

```bash
docker-compose run --rm ap bundle init
```

3. Edit Gemfile

Gemfile
```diff
- # gem "rails"
+ gem "rails"
```

4. Generate rails app

```bash
docker-compose run --rm ap bundle exec rails new . --force
```

5. Start rails

```bash
docker-compose up
```


## Setup Pry

Gemfile
```diff
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
+   # pry
+   gem 'pry-rails'
+   gem 'pry-byebug'
+   gem 'pry-stack_explorer'
end
```


## Setup I18n

Gemfile
```diff
+ group :default do
+   gem 'rails-i18n', '~> 6.0.0'
+ end
```


## Setup RSpec

Gemfile
```diff
group :development, :test do
...
+   # rspec
+   gem 'rspec-rails'
+   gem 'factory_bot_rails'
+   gem 'faker', require: false
end
...
group :test do
...
+   # rspec
+   gem 'simplecov', require: false
end
```
required on generate


```bash
docker-compose run --rm ap bin/rails g rspec:install
```

spec/rails_helper.rb
```diff
# require only the support files necessary.
#
- # Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
+ Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
```


## Setup Rubocop

Gemfile
```diff
group :development, :test do
...
+   # rubocop
+   gem 'rubocop-performance', require: false
+   gem 'rubocop-rails', require: false
+   gem 'rubocop-rake', require: false
+   gem 'rubocop-rspec', require: false
end
```

```bash
docker-compose run --rm ap rubocop --init
```

.rubocop.yml
```diff
+ require:
+   - rubocop-performance
+   - rubocop-rails
+   - rubocop-rake
+   - rubocop-rspec
```

