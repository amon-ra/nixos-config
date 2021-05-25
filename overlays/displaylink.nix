final: prev: {
  displaylink = prev.displaylink.overrideAttrs (old: {
    src = {
      name = ./displaylink.zip;
      sha256 = "88d6ce5a076d76746c41119ee8594d4ffba5af2d20c3793849d77147ed1a54d4";
    };
  });
}