{ config, lib, pkgs, inputs, modulesPath, ... }:
let 
  mitigations = "ibrs noibpb nopti nospectre_v2 nospectre_v1 l1tf=off nospec_store_bypass_disable no_stf_barrier mds=off tsx=on tsx_async_abort=off mitigations=off";
in {
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd 
      inputs.nixos-hardware.nixosModules.common-gpu-amd-sea-islands
    ];

  boot.kernelPackages = pkgs.linuxPackages_5_10;
  # boot.kernelPackages = pkgs.unstable.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "acpi_call" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "amdgpu" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  boot.kernelParams = [ "amd_iommu=pt" ] ++ lib.splitString " " mitigations;
  # https://bugzilla.kernel.org/show_bug.cgi?id=110941
  #boot.kernelParams = [ "intel_pstate=no_hwp" ];
  #boot.kernelParams = [ "amd_iommu=pt" "ivrs_ioapic[32]=00:14.0" "iommu=soft" ];
  
  # video
  # services.xserver.videoDrivers = [ "displaylink" "modesetting" ];  
  services.xserver.videoDrivers = [ "displaylink" "amdgpu" ];  

  #fix touchpac
  # hardware.enableAllFirmware = true;
  
  # CPU
  nix.maxJobs = lib.mkDefault 16;
  powerManagement.cpuFreqGovernor = "ondemand";
  hardware.cpu.amd.updateMicrocode = true;

  # kernelParams = [
  #   "transparent_hugepage=never"
  # ];
  #boot.loader.grub.copyKernels = true;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportAll = false;
  boot.zfs.devNodes = "/dev/disk/by-partuuid";
  services.zfs.autoScrub.enable = true;
  services.zfs.trim.enable = true;
  services.zfs.autoSnapshot = {
    enable = true;
    frequent = 4; # keep the latest eight 15-minute snapshots (instead of four)
    hourly = 12;
    daily = 7;
    weekly = 4;
    monthly = 1; # keep only one monthly snapshot (instead of twelve)
  };

  services.tlp.enable = lib.mkDefault true;
  services.fstrim.enable = lib.mkDefault true;
  networking.hostId = "10faa34b";

  fileSystems."/" =
    {
      device = "rpool/root/nixos";
      fsType = "zfs";
    };

  #boot.initrd.luks.devices."luks-nixos-root".device = "/dev/disk/by-uuid/a7561bd1-f3ef-4f4d-ab3b-69121e64689f";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/home" =
    {
      device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/tmp" =
    {
      device = "rpool/tmp";
      fsType = "zfs";
    };

  # boot.initrd.luks.devices."luks-nixos-var".device = "/dev/disk/by-uuid/54c4bc98-ac8c-43e1-9c98-1889ff858dfc";
  # luks-nixos-var contains an LVM so it needs to be opened after LVM has been
  # activated
  # boot.initrd.luks.devices."luks-nixos-var".preLVM = false;

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  # high-resolution display
  # hardware.video.hidpi.enable = lib.mkDefault true;
}
