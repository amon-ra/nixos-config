final: prev: {
  displaylink = prev.displaylink.overrideAttrs (old: {
    src = ./displaylink.zip;
  });
}