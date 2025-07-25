FROM nixos/nix:latest@sha256:7894650fb65234b35c80010e6ca44149b70a4a216118a6b7e5c6f6ae377c8d21 AS builder

WORKDIR /app

RUN echo "filter-syscalls = false" >> /etc/nix/nix.conf;

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install;

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
