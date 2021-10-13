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
