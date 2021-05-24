{ options, config, pkgs, lib, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    user.packages = with pkgs; [
      sshpass
    ];
    
    services.openssh = {
      enable = true;
      challengeResponseAuthentication = false;
      passwordAuthentication = true;
      forwardX11 = true;
      permitRootLogin = "no";
      startWhenNeeded = true;      
    };

    user.openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC80KJpXplFDw24S92zUJ7dp/daOw5Ro+libChayhUjDIvnujqlq5hAkL+4eYNWEdRnhIwzvdAQpm31/8rrFSB1p/r7x+FvJmPmS3sbhiTbTKpVUfD9AMsqk9AfsCHBUei8/RGMpxrwcxQ9nw05zT7pawPGpklu4qBRsPgh4dkVA0jZYcIFE6IkleUvEfjOqlglgfAPi1NOFBJ+20jeGSfvMrtl0hZoYik4aPoeiZfYi6J+qlfPZrmMf7L8ZOL5ftiT1GsH+m6enZeQ/vBiRWcaXM5wrBkqyg/6x7Pav8eR9G3skly0KzUqcXLbqhFPLHt0YglhXwW86P9KVQjucsa/88QkmYARRV/CBl07cjVZDIyAKXrKgXu3E1+bnBMVCt0Gty+6xh6EpP4jxDdnT7wbyyJpTdrAEBlVXFxNigxmVqqrvw5WwopbQRC3hx77aL1xTuI2+V5DNv9obsyTopYUkB8XUsS0KqA3Leod19nfk8VAM9HqfUTpWdQW7IVUbrIneSjp5NeVdU/VL8dUhyyH8yNlXEZmX811l59oloHHRkLSk07p18Lnv/MWuS2tZxgNz9VtRCitU5xSVgok8pdps/TU/RuQzy9FDTP36SWRq/3oCvL/iPZ5Uh9QPwXCPjT92yG3IlaJ3cIjYHEhJu2u7W8PId+guvg9Q+d2wkdxPw== amon.raj@gmail.com"
    ];
  };
}
