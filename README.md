# Github Pages - Development Docker Container

[![Docker Container Image Size](https://shields.beevelop.com/docker/image/image-size/cjimti/jekyll/latest.svg)](https://hub.docker.com/r/cjimti/jekyll/)
[![Docker Container Layers](https://shields.beevelop.com/docker/image/layers/cjimti/jekyll/latest.svg)](https://hub.docker.com/r/cjimti/jekyll/)
[![Docker Container Pulls](https://img.shields.io/docker/pulls/cjimti/jekyll.svg)](https://hub.docker.com/r/cjimti/jekyll/)

Github Pages, local Jekyll site development with Docker

No need to install Ruby, rvm, bundler, etc. Only requirement is [Docker].

Fork and build your own Jekyll container or use the the docker-compose configuration below:

**docker-compose.yml**:
```
# Run jekyll build and serve from a Docker container
# for easy local development of a Github Pages Jekyll site.
version: '3'
services:
  build:
    image: "cjimti/jekyll"
    container_name: jekyll-build
    volumes:
      - .:/src
    working_dir: /src
    command:
      - "build"
      - "--watch"
  serve:
    image: "cjimti/jekyll"
    container_name: jekyll-serve
    ports:
     - "4000:4000"
    volumes:
      - .:/src
    depends_on:
      - build
    working_dir: /src/_site
    command:
      - "serve"
      - "--incremental"
      - "-H"
      - "0.0.0.0"   
```

Run `docker-compose up` from a terminal in the base of the repository.

Browse to http://127.0.0.1:4000

### Run without compose

Build your site once with the following command:

```bash
docker run --rm -v "$(pwd)":/src cjimti/jekyll build
```

Serve your static site and watch for changes:

```bash
docker run --rm -v "$(pwd)":/src -w /src/_site -p 4000:4000 \
      cjimti/jekyll serve --incremental -H 0.0.0.0
```

Browse to http://127.0.0.1:4000

[Docker]: https://www.docker.com/
[docker-compose]: https://docs.docker.com/compose/