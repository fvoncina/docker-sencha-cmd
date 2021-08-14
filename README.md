# How to use this image

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
