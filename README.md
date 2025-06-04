# ljc-cli

ljc-cli is a docker image that could empower the CI/CD pipeline. It has multiple CLIs so that way you do not have to worry some command line does not other commandline

## Docker Arch

Currently, the docker image is based on **linux/amd64**

### Tool included

- [kubectl - 1.32.0](https://kubernetes.io/docs/reference/kubectl/)
- [helm - 3.16.4](https://helm.sh/)
- [awscliv2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [yq - 4.44.6](https://mikefarah.gitbook.io/yq)
- [terraform - 1.12.1](https://developer.hashicorp.com/terraform)
- [git](https://git-scm.com/downloads)
- [curl](https://curl.se/)
- [wget](https://www.gnu.org/software/wget/)
- [bash](https://www.gnu.org/software/bash/)
- [jq](https://jqlang.org/)
- [vim](https://www.vim.org/)
- [zip/unzip](https://www.geeksforgeeks.org/how-to-install-zip-and-unzip-in-linux/)

## Usage

```
docker pull jcheng919/ljc-cli:1.0.3
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
