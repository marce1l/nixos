{
  programs.firefox = {
    enable = true;
    # Preserve the existing profile location. Moving it requires a manual migration.
    configPath = ".mozilla/firefox";
  };
}
