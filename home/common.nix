{ hostName, ... }:

{
  home.username = "cloud";
  home.homeDirectory = "/home/cloud";
  home.stateVersion = "24.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      nixbuild = "sudo nixos-rebuild switch --flake ~/nixos#${hostName}";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "marce1l";
        email = "mikesmarcell@gmail.com";
      };
      init.defaultBranch = "master";
    };
  };

  programs.home-manager.enable = true;
}
