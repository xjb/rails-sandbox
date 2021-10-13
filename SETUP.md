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
