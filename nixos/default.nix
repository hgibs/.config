# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      enable = true;
      # theme = "sleek-grub-theme";
      useOSProber = true;
    };
    systemd-boot.enable = false;
  };
  environment.systemPackages = with pkgs; [
    broot
    byobu
    eza
    git
    helix
    jq
    kitty
    neofetch
    nerdfonts
    noto-fonts
    openssh
    python312
    rustup
    ripgrep
    sleek-grub-theme
    starship
    steam
    tealdeer
    tmux
    zellij
    zoxide
  ];
  environment.variables.EDITOR = "hx";
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "Hack"];})
  ];
  hardware.pulseaudio.enable = false;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  networking = {
    hostName = "nixos";
    wireless.enable = true;
    interfaces.eth0.ipv4.addresses = [
      {
        address = "10.34.0.79";
        prefixLength = 16;
      }
    ];
    defaultGateway = "10.34.0.1";
    nameservers = ["10.33.11.201"];
    networkmanager = {
      enable = true;
      unmanaged = [ "eth0" ];
    };
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };
  services = {
    openssh = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    printing.enable = true;
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      displayManager.sddm.enable = true;
      layout = "us";
      xkbVariant = "";
    };
  };
  sound.enable = true;
  system = {
    autoUpgrade = {
      enable = true;
      dates = "09:00";
      flags = [
        "--update-input"
        "nixpkgs"
        "-L"
      ];
      randomizedDelaySec = "45min";
    };
    stateVersion = "23.11"; # Did you read the comment?
  };
  time.timeZone = "America/New_York";
  users.users = {
    hollandgibson = {
      isNormalUser = true;
      description = "Holland Gibson";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
        firefox
        kate
      ];
      openssh.authorizedKeys.keys = ["ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBillLJ5wk4c/gN6NLQjypX/5jOL091Cd708K7WLUHIpqq6STP5A63TwWqay7LnGABpcJJFOGtodFo8kWa3xs6w="];
      shell = pkgs.fish;
    };
    ansible = {
      description = "Ansible Management";
      isNormalUser = true;
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvXLv0F0vjHdipn075hM4HYtR6okAyhWADc5Nj7epSo ansible@home.hollandgibson.com"];
      useDefaultShell = true;
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs = {
    # can set helix as default editor?
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
      ];
    };
    # sleek-grub-theme.withStyle = "orange";
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
