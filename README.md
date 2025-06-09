<div align="center">

<img src="./assets/img/vault-logo.png" alt="HashiCorp Vault" width="25%">

# Vault Workshop

![GitHub last commit](https://img.shields.io/github/last-commit/f4z3r/vault-workshop)

### An interactive workshop to learn how to use Vault and operate it in production. This should serve as a comprehensive guide on the most important aspects.

[Learning Objectives](#learning-objectives) |
[Getting Started](#getting-started)

<hr />
</div>

## Learning Objectives

## Getting Started

There are two ways to start this workshop: using `docker` or using `devbox`.

### Docker

The easiest way to get started is to use the latest `docker` image from the GitHub container
registry and get started:

```sh
export HASH="$(git log -n 1 --pretty=format:'%H')"
docker run --rm \
  -p 8888:8888 \
  -p 8200:8200 \
  --name vault-workshop \
  -v /tmp/vault \
  -v ./:/app/ \
  vault-workshop:$HASH
```

Then navigate `http://localhost:8888` in your browser. You will find the modules under the
`./modules/`. Ideally start with `01-introduction.ipynb` to get some general information on the
workshop.

#### Local Shell

If you want a shell to access the required tooling, run:

```sh
docker exec -it vault-workshop \
  nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox shell
```

#### Building the Image

If you want to build the `docker` image yourself, simply run:

```sh
HASH="$(git log -n 1 --pretty=format:'%H')"
docker build -t vault-workshop:$HASH .
```

### DevBox

An alternative way is to use [`devbox`](https://www.jetify.com/devbox) to start the lab environment.
You can install DevBox using the [official
documentation](https://www.jetify.com/docs/devbox/installing_devbox/) and then run:

```sh
devbox run start
```

Then navigate `http://localhost:8888` in your browser. You will find the modules under the
`./modules/`. Ideally start with `01-introduction.ipynb` to get some general information on the
workshop.

#### Local Shell

If you want a shell to access the required tooling, run:

```sh
devbox shell
```
