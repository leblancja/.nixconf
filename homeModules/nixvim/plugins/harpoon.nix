{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;

      keymaps = {
        addFile = "<Leader>a";
        toggleQuickMenu = "<C-e>";
        
        navFile = {
          "1" = "<C-j>";
          "2" = "<C-k>";
          "3" = "<C-l>";
          "4" = "<C-m>";
        };
      };
    };
  };
}
