# modules/desktop/vscodium.nix

{ config, options, lib, pkgs, home-manager, ... }:

with lib;
with lib.my;
let cfg = config.modules.desktop.vscodium;
  extensions = (with pkgs.unstable.vscode-extensions; [
    bbenoist.Nix
    # arrterian.nix-env-selector
    ms-python.python
    # ms-azuretools.vscode-docker
    ms-vscode-remote.remote-ssh
    # Wakatime.vscode-wakatime
    #vscoss.vscode-ansible
    #hookyqr.beautify
    #samuelcolvin.jinjahtml
    # giladgray.theme-blueprint
    # teamchilla.blueprint
    # alefragnani.bookmarks
    # deerawan.vscode-dash
    # msjsdiag.debugger-for-chrome
    # batisteo.vscode-django
    # editorconfig.editorconfig
    # dbaeumer.vscode-eslint
    # mrorz.language-gettext
    # eamodio.gitlens
    # dchanco.vsc-invoke
    # xabikos.javascriptsnippets
    # wholroyd.jinja
    # dbaeumer.jshint
    # ms-vsliveshare.vsliveshare-pack
    # emilast.logfilehighlighter
    # actboy168.lua-debug
    # davidanson.vscode-markdownlint
    # jeffery9.odoo-snippets
    # jigar-patel.odoosnippets
    # sandcastle.vscode-open
    # fabiospampinato.vscode-open-multiple-files
    # ryu1kn.partial-diff
    # felixfbecker.php-pack
    # esbenp.prettier-vscode
    # ms-python.vscode-pylance
    # njpwerner.autodocstring
    # kevinrose.vsc-python-indent
    # mgesbert.python-path
    # mechatroner.rainbow-csv
    # ms-vscode-remote.remote-ssh-edit
    # eamodio.restore-editors
    # emeraldwalk.runonsave
    # syler.sass-indented
    # actboy168.tasks
    # wayou.vscode-todo-highlight
    # gruntfuggly.todo-tree
    # octref.vetur
    # visualstudioexptteam.vscodeintellicode
    # uctakeoff.vscode-counter
    # bajdzis.vscode-database
    # yahya-gilany.vscode-pomodoro
    # johnbillion.vscode-wordpress-hooks
    # redhat.vscode-xml
  ])
    #   ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
    #     name = "remote-ssh-edit";
    #     publisher = "ms-vscode-remote";
    #     version = "0.47.2";
    #     sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    # }]
  ;
  vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = extensions;
  };  
in {
  options.modules.desktop.vscodium = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      vscodium-with-extensions
    ];
    home.configFile = {
          "Code/User/keybindings.json".source = "${configDir}/Code/keybindings.json";
          "Code/User/settings.json".source = "${configDir}/Code/settings.json";
          "Code/User/snippets".source = "${configDir}/Code/snippets";
          "Code/User/blueprint-templates".source = "${configDir}/Code/blueprint-templates";
    };       
    # home-manager.users.${config.user.name}.programs.vscode = {
    #   enable = true;
    #   package = pkgs.vscodium;
    #   extensions = vscodeExtensions;
    #   keybindings = [
    #     {
    #       key = "ctl+ç";
    #       command = "editor.action.commentLine";
    #       #when ="";
    #     }
    #   ];
    #   userSettings = {
    #     terminal.integrated.shell.linux = "${pkgs.zsh}/bin/zsh";
    #     window.zoomLevel = 0;
    #     editor = {
    #       fontFamily = "'JetbrainsMono Nerd Font', 'monospace', monospace, 'Droid Sans Fallback'";
    #       fontLigatures = true;
    #     };

    #     workbench = {
    #       iconTheme = "eq-material-theme-icons-darker";
    #       colorTheme = "Material Theme Ocean High Contrast";
    #     };
    #     python.dataScience.disableJupyterAutoStart = true;
    #     python.dataScience.searchForJupyter = false;
    #     python.dataScience.allowImportFromNotebook = false;
    #     python.dataScience.enableScrollingForCellOutputs = false;
    #     editor.maxTokenizationLineLength = 200000;
    #   };
    # };
  };
}
