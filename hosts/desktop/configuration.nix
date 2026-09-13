{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  networking.hostName = "nixos";

  security.pki.certificateFiles = [
    ./certificates/caddy-local-root.crt
  ];
}
