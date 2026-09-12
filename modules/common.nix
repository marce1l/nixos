{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    8080
    8888
  ];
  networking.extraHosts = ''
    127.0.0.1 reservations.local
    127.0.0.1 app.reservations.local
  '';

  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.cloud = {
    isNormalUser = true;
    description = "Cloud";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks

    vscode
    spotify
    discord
    google-chrome
    ghostty

    # Development tools.
    gcc
    gnumake
    git
    nixfmt
    nixd
    nodejs_24
    go
    air
    caddy
    golangci-lint
    tailwindcss

    # Additional desktop applications.
    anydesk
    t3code
    codex
  ];

  environment.sessionVariables = {
    FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  };

  virtualisation.docker.enable = true;
  services.openssh.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      hostName = config.networking.hostName;
    };
    users.cloud = import ../home/common.nix;
  };

  system.stateVersion = "24.11";
}
