<div align="center">

<img src="./assets/img/vault-logo.png" alt="HashiCorp Vault" width="25%">

# Vault Workshop

![GitHub last commit](https://img.shields.io/github/last-commit/f4z3r/vault-workshop)
![GitHub Release](https://img.shields.io/github/v/release/f4z3r/vault-workshop)
![GitHub License](https://img.shields.io/github/license/f4z3r/vault-workshop)

### An interactive workshop to learn how to use Vault and operate it in production. This should serve as a comprehensive guide on the most important aspects.

[About](#about) |
[Curriculum](#curriculum) |
[Usage](#usage) |
[License](#license)

<hr />
</div>

## About

Originally developed for internal training sessions, this Vault workshop provides a comprehensive
overview of how to use HashiCorp Vault in production.

This workshop mostly focuses on the community (open source) version of Vault, with elements of the
enterprise Vault potentially being added in the future. Moreover, this does not aim at replacing the
official HashiCorp tutorials, but rather complement them.

The workshop is built on Jupiter Notebooks and is structured in modules that can be run
independently from one another.

## Curriculum

<!-- TODO(@f4z3r): refine this -->

This workshop is aimed at providing a comprehensive overview on how to use Vault and how to operate
it. It focuses on:

1. Vault fundamentals, such as understanding the encryption barrier and seals.
2. Usage:
   1. Authentication methods.
   2. Secret engines.
3. Operations:
   1. Root token generation.
   2. Server configuration.
   3. Terraform configuration.
   4. Backup and Restore mechanisms.
   5. Log analysis.

## Usage

There are two ways to get started with this workshop: using `docker` or using `devbox`.

### Docker

The easiest way to get started is to use the latest `docker` image from the GitHub container
registry and get started:

```sh
docker run --rm \
  -p 8888:8888 \
  -p 8200:8200 \
  --name vault-workshop \
  -v /tmp/vault \
  -v ./:/app/ \
  ghcr.io/f4z3r/vault-workshop:main
```

Then navigate `http://localhost:8888` in your browser. You will find the modules under the
`./modules/`. Ideally start with `01-introduction.ipynb` to get some general information on the
workshop.

#### Local Shell

If you want a shell to access the required tooling within the container, run:

```sh
docker exec -it vault-workshop \
  nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox shell
```

#### Building the Image

If you want to build the `docker` image yourself, run:

```sh
export HASH="$(git log -n 1 --pretty=format:'%H')"
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

## License

![GitHub License](https://img.shields.io/github/license/f4z3r/vault-workshop)

The license can be found under [`./LICENSE`](./LICENSE).
