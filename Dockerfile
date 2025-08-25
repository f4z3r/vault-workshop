FROM nixos/nix:latest@sha256:0e6ade350a4d86d76dd4046a654ccbbb58d14fe93b6e3deef42c1d0fd9db3849 AS builder

WORKDIR /app

RUN echo "filter-syscalls = false" >> /etc/nix/nix.conf;

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install;

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
