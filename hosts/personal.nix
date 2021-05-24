{ config, lib, ... }:

with lib;
{
  networking.hosts =
    let hostConfig = {
          "127.0.0.1"  = [ "tor" "minio" ];
        };
        hosts = flatten (attrValues hostConfig);
        hostName = config.networking.hostName;
    in mkIf (builtins.elem hostName hosts) hostConfig;

  ## Location config -- since Vienna is my 127.0.0.1
  time.timeZone = mkDefault "Europe/Madrid";
  i18n.defaultLocale = mkDefault "es_ES.UTF-8";
  # For redshift, mainly
  # Go try find my home with those coordinates 
  # as those are randomly picked within a range near my home
  location = (if config.time.timeZone == "Europe/Madrid" then {
    latitude = 38.9977;
    longitude = -1.86;
  } else {});
}
