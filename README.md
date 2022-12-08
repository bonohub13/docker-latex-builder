# Docker LaTeX build tool

## What is this?
Build tool to compile LaTeX documents into PDF file(s) using docker

## Why does this exist?
LaTeX requires a lot of packages to compile. To mitigate this issue, all of the\
necessary tools are containerized inside a Docker container.

## How to use
- Required packages
    - Docker (If possible, docker-rootless is better)
        - [docker-rootless](https://docs.docker.com/engine/security/rootless/)
    - Make

- Building docker container
``` bash
make build-linux-image
```
- Building LaTeX document(s) with docker
``` bash
make build
```

That's it!
