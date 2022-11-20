# jq Docker

This project produces jq binaries and docker images using sources located at
https://api.github.com/repos/stedolan/jq/ with the following goals:

* Provide an easy way to get the latest version of jq
* Provide amd64 and arm64 versions of jq for Linux
* Provide single layered Docker images

## How do I get the latest version of jq into my docker image?

```
COPY --from=truemark/jq:latest /usr/local/ /usr/local/
```

## Maintainers

- [erikrj](https://github.com/erikrj)

## License

The contents of this repository are released under the BSD 3-Clause license. See the
license [here](https://github.com/truemark/git-crypt-docker/blob/main/LICENSE.txt).


