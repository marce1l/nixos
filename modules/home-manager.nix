{ inputs, flakeHostName, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    # Use the same nixpkgs instance and configuration as NixOS.
    useGlobalPkgs = true;
    # Preserve existing files when first taking them under Home Manager control.
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs flakeHostName;
    };
    users.cloud = import ../home/common.nix;
  };
}
