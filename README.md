Image to run [Sencha Cmd](http://www.sencha.com/products/sencha-cmd/#overview).

## What's Inside

This image is based of [Ubuntu](https://hub.docker.com/_/ubuntu/) (some issues with PhantomJS on debian)

## Supported tags and respective `Dockerfile` links

* [`7.2.0.66`, `latest`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/7.2.0.66/Dockerfile)
* [`7.1.0.15`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/7.1.0.15/Dockerfile)
* [`7.0.0.40`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/7.0.0.40/Dockerfile)
* [`6.7.0.63`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/6.7.0.63/Dockerfile)
* [`6.6.0.13`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/6.6.0.13/Dockerfile)
* [`6.5.3.6`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/6.5.3.6/Dockerfile)
* [`6.2.2`](https://github.com/fvoncina/docker-sencha-cmd/blob/master/6.2.2/Dockerfile)

## How to use this image

Basic usage

```shell
docker run --rm -v /local/path:/project fvoncina/docker-sencha-cmd [<options>]
```

For example, to generate new ExtJS application on current directory

```shell
docker run --rm -v "$(pwd)":/project fvoncina/docker-sencha-cmd -sdk /path/to/ext-x.x.x.x generate app MyApp .
```

To build an application on current directory

```shell
docker run --rm -v "$(pwd)":/project fvoncina/docker-sencha-cmd app build
```

Or, you can use [Docker Compose](https://docs.docker.com/compose/)'s docker-compose.yml

```yaml
sencha:
    image: fvoncina/docker-sencha-cmd
    volumes:
        - /local/path:/project
```

And run it via

```shell
docker-compose run sencha [<options>]
```

## Inspiration
* https://github.com/herloct/docker-sencha-cmd
