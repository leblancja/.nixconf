{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jordanl = {
    isNormalUser = true;
    description = "Jordan LeBlanc";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    home = "/home/jordanl";
    shell = pkgs.zsh;
  };
}
