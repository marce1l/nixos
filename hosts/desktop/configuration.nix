{ config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  networking.hostName = "nixos";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # The GTX 980 requires the proprietary module and the 580 driver branch.
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    open = false;
    modesetting.enable = true;
    # Preserve video memory across sleep using NVIDIA's suspend/resume services.
    powerManagement.enable = true;
  };

  security.pki.certificateFiles = [
    ./certificates/caddy-local-root.crt
  ];
}
