FROM nixos/nix:latest@sha256:016f07dddeb5feabeb75c360edb840ff4df3b89c7e0ca7ff1faea6240ce8375a AS builder

WORKDIR /app

COPY devbox.json .
COPY devbox.lock .

RUN nix --extra-experimental-features "nix-command flakes" run nixpkgs#devbox install

ENTRYPOINT ["nix", "--extra-experimental-features", "nix-command flakes", "run", "nixpkgs#devbox", "run", "start"]
