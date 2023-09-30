# Use a minimal base image that can run your shell.nix
FROM nixos/nix:latest

# Copy Nix environment specification
COPY shell.nix /app/shell.nix

# Set the working directory
WORKDIR /app

# Install Nix packages and enter the development environment
CMD ["nix-shell", "--arg", "nixpkgs", "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.05.tar.gz"]
