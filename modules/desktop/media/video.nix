# modules/desktop/media/video.nix

{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.media.video;
in {

  options.modules.desktop.media.video = {
    enable             = mkBoolOpt false;
    player.enable      = mkBoolOpt false;
    vlc.enable      = mkBoolOpt true;
    recording.enable   = mkBoolOpt false;
    cut.enable         = mkBoolOpt false;
    transcode.enable   = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    nixpkgs.config.permittedInsecurePackages = [
      "ffmpeg-3.4.8"
    ];
    user.packages = with pkgs; [
      ffmpeg-full
      (mkIf cfg.player.enable mpv-with-scripts)
      (mkIf cfg.player.enable mpvc)
      (mkIf cfg.vlc.enable vlc)
      (mkIf cfg.recording.enable obs-studio)
      (mkIf cfg.recording.enable vokoscreen)
      (mkIf cfg.cut.enable kdenlive)
      (mkIf cfg.cut.enable unstable.natron)
      (mkIf cfg.transcode.enable handbrake)
    ];
  };
}
