FROM nixos/nix:latest@sha256:8c144c6c37184fe03fd7fed740c6eeb2ecfd801d6e34a6aba4e38f1c8d10de3e AS builder

WORKDIR /app

RUN echo "filter-syscalls = false" >> /etc/nix/nix.conf;

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install;

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
