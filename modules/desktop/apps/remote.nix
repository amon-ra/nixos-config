# modules/desktop/apps/anki.nix

{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.apps.remote;
in {
  options.modules.desktop.apps.remote = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      anydesk
      teamviewer
    ];
    services.teamviewer.enable = true;
  };
}
