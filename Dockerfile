FROM nixos/nix:latest@sha256:746280551ddc1c72177d1a597c05eacac86dfaa18d5d649bf86411278bcd5470 AS builder

WORKDIR /app

RUN echo "filter-syscalls = false" >> /etc/nix/nix.conf;

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install;

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
