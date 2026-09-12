{ ... }:

{
  imports = [
    ./packages.nix
    ./programs/bash.nix
    ./programs/firefox.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/vscode.nix
  ];

  home.username = "cloud";
  home.homeDirectory = "/home/cloud";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
