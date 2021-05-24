{ ... }:
{
  imports = [
    ../personal.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable		  = true;
      documents.enable 	= true;
      flatpak.enable    = true;
      keepassxc.enable 	= true;
      kvantum.enable    = true;
      screenshot.enable = true;
      thunar.enable     = true;
      vscodium.enable   = true;
      apps = {
        anki.enable           = true;
        blender.enable        = true;
        calibre.enable        = true;
        ghostwriter.enable    = true;
        godot.enable          = true;
        gpa.enable            = true;
        gsmartcontrol.enable  = true;
        nextcloud.enable      = false;
        rofi.enable           = true;
        torrent.enable        = true;
      };
      browsers = {
        default			        = "firefox";
        chromium.enable 	  = true;
        firefox.enable 	    = true;
        qutebrowser.enable 	= false;
        tor.enable          = false;
      };
      communication = {
        delta.enable    = false;
        discord.enable  = false;
        jitsi.enable    = false;
        matrix.enable   = false;
        signal.enable   = false;
        telegram.enable = true;
      };
      media = {
        graphics.enable  = true;
        video.enable     = true;
        audio.enable     = true;
        daw.enable       = false;
      };
      term = {
        default      = "kitty";
        st.enable    = false;
        kitty.enable = true;
      };
      vm = {
        qemu.enable         = true;
        virtualbox.enable   = false;
        virt-manager.enable = true;
      };
    };
    dev = {
      cc.enable          = true;
      clojure.enable     = false;
      common-lisp.enable = false;
      go.enable          = true;
      julia.enable  		 = false;
      lua.enable         = false;
      node.enable        = false;
      python.enable      = true;
      rust.enable        = true;
      scala.enable       = false;
      shell.enable       = true;
    };
    editors = {
      default      = "kakoune";
      emacs.enable = true;
      kakoune.enable   = true;
      # micro.enable = true;
    };
    hardware = {
      audio.enable      = true;
      bluetooth.enable  = true;
      fs = {
        enable = true;
        zfs.enable = true;
        ssd.enable = true;
      };
      fancontrol.enable = true;
      keebs.enable      = false;
      nvidia.enable     = false;
      sensors.enable    = true;
      wacom.enable      = false;
    };
    shell = {
      archive.enable  = true;
      direnv.enable   = false;
      git.enable      = true;
      gnupg.enable    = true;
      mail.enable     = true;
      pass.enable     = true;
      taskell.enable  = true;
      zsh.enable      = true;
      cli.enable      = true;
    };
    services = {
      docker.enable 		  = false;
      gitea.enable  		  = false;
      jellyfin.enable		  = false;
      k8s.enable    		  = false;
      nginx.enable			  = false;
      vpn.enable          = false;
      ssh.enable    		  = true;
      transmission.enable	= false;
    };
    theme.active = "quack";
  };

  ## Local config
  programs.ssh.startAgent           = true;
  services.openssh.startWhenNeeded  = true;
  networking.networkmanager.enable  = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false
  # here. Per-interface useDHCP will be mandatory in the future, so this
  # generated config replicates the default behaviour.
  networking.useDHCP                = false;
  # set eurkey as default layout
  # set more keymaps and use them with bin/keymapswitcher
  services.xserver.layout           = "es";
}
