{
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    8080
    8888
  ];

  networking.extraHosts = ''
    127.0.0.1 reservations.miketsu.com
    127.0.0.1 app.reservations.miketsu.com
  '';
}
