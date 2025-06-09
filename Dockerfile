FROM nixos/nix:latest AS builder

WORKDIR /app

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
