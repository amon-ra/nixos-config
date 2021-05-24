{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.hardware.wacom;
in
{
  options.modules.hardware.wacom = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    # Works for my Wacom Intuos Pro Medium on NixOS 20.09
    services.xserver.wacom.enable = true;
    
    environment.systemPackages = with pkgs; [
      unstable.libwacom
    ];
    
    # Lock tablet to main display
    system.userActivationScripts.wacom = ''
      if xinput list --id-only "Wacom Intuos Pro M Pen stylus" 2>&1 >/dev/null; then
        xinput map-to-output $(xinput list --id-only "Wacom Intuos Pro M Pen stylus") eDP
        xinput map-to-output $(xinput list --id-only "Wacom Intuos Pro M Pen eraser") eDP
        xinput map-to-output $(xinput list --id-only "Wacom Intuos Pro M Pen cursor") eDP
      fi
    '';
  };
}
