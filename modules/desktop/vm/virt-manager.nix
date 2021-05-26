# modules/desktop/vm/virt-manager.nix

{ options, config, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.vm.virt-manager;
in {
  options.modules.desktop.vm.virt-manager = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      unstable.virt-manager
      unstable.libvirt
    ];
    
    user.extraGroups = [ "libvirtd" ];

    programs.dconf.enable = true;
    virtualisation.libvirtd.enable = true;
  };
}
