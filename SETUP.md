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
      - bundle:/usr/local/bundle
      - node_modules:/workspace/node_modules
    tty: true
    stdin_open: true

volumes:
  bundle:
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

```bash
docker-compose run --rm ap rubocop --auto-gen-config
```

```bash
docker-compose run --rm ap rubocop --auto-correct-all
```


## Setup erb-lint

Gemfile
```diff
group :development, :test do
...
+   gem 'erb_lint', require: false
end
```

```bash
docker-compose run --rm ap erblint --lint-all
```

```bash
docker-compose run --rm ap erblint --lint-all --autocorrect
```


## Setup Brakeman

Gemfile
```diff
group :development, :test do
...
+   gem 'brakeman', require: false
end
```


## Setup bundler-audit

Gemfile
```diff
group :development, :test do
...
+   gem 'bundler-audit', require: false
end
```


## Generate Scaffold

```bash
docker-compose run --rm ap bin/rails g scaffold user name:string email:string
```

```bash
docker-compose run --rm ap bin/rails g scaffold book title:string type:string description:text book:references
```


## Delete Scaffold

```bash
docker-compose run --rm --entrypoint="" ap bin/rails d scaffold user
```


## Reset DB

```bash
docker-compose run --rm --entrypoint="" ap bin/rails db:migrate:reset
```


## Generate DB data

```bash
docker-compose run --rm --entrypoint="" ap bin/rails db:seed
```


## Setup Bootstrap

```bash
docker-compose run --rm --entrypoint="" ap yarn add bootstrap bootstrap-icons @popperjs/core
```

app/javascript/packs/application.js
```js
import "stylesheets"
import "bootstrap"
import "bootstrap-icons/font/bootstrap-icons.css"
```

app/javascript/stylesheets/index.scss
```scss
@import "~bootstrap/scss/bootstrap";
```

app/views/layouts/application.html.erb
```diff
-     <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
+     <%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
```

config/webpacker.yml
```diff
  # Extract and emit a css file
  extract_css: false
...
production:
...
  # Extract and emit a css file
  extract_css: true
```


## Setup Bootstrap Provide

config/webpack/environment.js
```diff
const { environment } = require('@rails/webpacker')

+ const webpack = require('webpack')
+ environment.plugins.prepend(
+   'Provide',
+   new webpack.ProvidePlugin({
+     bootstrap: 'bootstrap'
+   })
+ )
+
module.exports = environment
```

app/javascript/packs/application.js
```diff
+ import "src"
```

app/javascript/src/index.js
```diff
+ import "./xxxxx.js"
```


## Setup webpack-dev-server

### add service

docker-compose.yml
```yml
  webpack:
    image: ghcr.io/xjb/rails:main
    entrypoint: ""
    command: ./bin/webpack-dev-server
    volumes:
      - .:/workspace
      - bundle:/usr/local/bundle
      - node_modules:/workspace/node_modules
```

### webpacker compile off

config/webpacker.yml
```diff
development:
  <<: *default
-   compile: true
+   compile: false
```

### proxy to dev_server

config/webpacker.yml
```diff
  dev_server:
    https: false
-     host: localhost
+     host: webpack
    port: 3035
    public: localhost:3035
```

### for HMR/liveReload

request to http://${dev_server.public}/sockjs-node/info?t=9999999999999

docker-compose.yml
```diff
  webpack:
    ...
+     ports:
+       - "3035:3035"
```

## Production

env
```
RAILS_ENV=production
RAILS_MASTER_KEY: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
RAILS_SERVE_STATIC_FILES: 1
```

```bash
bin/rails db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:seed
bin/rails webpacker:clobber webpacker:compile
```


### note

webpack.config.js == config/webpack/[Rails.env].js

