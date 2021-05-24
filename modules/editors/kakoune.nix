{ config, options, lib, pkgs, ... }:

with lib;
with lib.my;
let cfg = config.modules.editors.kakoune;
in {
  options.modules.editors.kakoune = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      unstable.micro
    ];
    environment.shellAliases = {
      # use fasd file finder for micro
      # m = "f -e micro";
      # just don't ask
      k = "kak";
    };
    environment.systemPackages = with pkgs; [
      clang-tools
      editorconfig-core-c
      # kak-lsp
      # kakoune-config
      kakoune
      nixpkgs-fmt
      python3Packages.python-language-server
      rustup
      nix-linter
      # dhall
      # dhall-lsp-server
      # haskellPackages.haskell-language-server
    ];
    environment.etc = {
      "xdg/kak-lsp/kak-lsp.toml".source = "${configDir}/kak-lsp.toml";
      "xdg/kak/kakrc".source = "${configDir}/kakrc";
      "xdg/kak/autoload/plugins-config".source = "${configDir}/plugins";
      "xdg/kak/autoload/lint".source = "${configDir}/lint";
      "xdg/kak/autoload/lsp".source = "${configDir}/lsp";
      "xdg/kak/autoload/default".source =
        "${pkgs.kakoune}/share/kak/rc";
      "xdg/kak/autoload/plugins".source =
        "${pkgs.kakoune}/share/kak/autoload/plugins";
    };    
  };
}
