{
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    8080
    8888
  ];

  networking.extraHosts = ''
    127.0.0.1 reservations.local
    127.0.0.1 app.reservations.local
  '';
}
