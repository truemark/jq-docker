# jq Docker

This project produces jq binaries and docker images using sources located at
https://api.github.com/repos/stedolan/jq/ with the following goals:

* Provide a way to get both amd64 and arm64 builds of jq
* Provide a way to copy jq from a single layer minimal docker image

## How do I get the latest version of jq into my docker image?

```
COPY --from=truemark/jq:latest /usr/local/ /usr/local/
```

## How do I download the latest version of jq without using docker?

Download arm64
```bash
curl -sSL $(curl -sSL https://api.github.com/repos/truemark/jq-docker/releases/latest | grep browser_download_url | grep arm64 | cut -d ':' -f 2,3 | tr -d \") -o jq
```

Download amd64
```bash
curl -sSL $(curl -sSL https://api.github.com/repos/truemark/jq-docker/releases/latest | grep browser_download_url | grep amd64 | cut -d ':' -f 2,3 | tr -d \") -o jq
```

## Maintainers

- [erikrj](https://github.com/erikrj)

## License

The contents of this repository are released under the BSD 3-Clause license. See the
license [here](https://github.com/truemark/git-crypt-docker/blob/main/LICENSE.txt).


