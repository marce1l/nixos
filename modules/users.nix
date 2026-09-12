{
  users.users.cloud = {
    isNormalUser = true;
    description = "Cloud";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
