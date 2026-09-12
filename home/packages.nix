{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-tweaks
    spotify
    discord
    google-chrome

    # Development tools.
    gcc
    gnumake
    nixfmt
    nixd
    nodejs_24
    go
    air
    caddy
    golangci-lint
    tailwindcss

    # Additional applications.
    anydesk
    t3code
    codex
  ];
}
