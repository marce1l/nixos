{ flakeHostName, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nixbuild = "sudo nixos-rebuild switch --flake ~/nixos#${flakeHostName}";
    };
  };
}
