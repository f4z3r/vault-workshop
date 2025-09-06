FROM nixos/nix:latest@sha256:24196c350d146529a4101edea9c82129308640b500ebbc01d225ad36b6322cb6 AS builder

WORKDIR /app

RUN echo "filter-syscalls = false" >> /etc/nix/nix.conf;

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install;

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
