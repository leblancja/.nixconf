{pkgs, ...}: {
  imports = [
    ./nixvim.nix
    ./plugins/conform.nix
    ./plugins/nvim-cmp.nix
    ./plugins/lsp.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix
    ./plugins/mini.nix
    ./plugins/telescope.nix
    ./plugins/gitsigns.nix
    ./plugins/undotree.nix
    ./plugins/autopairs.nix
    ./plugins/dap.nix
    ./plugins/harpoon.nix
    ./plugins/toggleterm.nix
    # ./plugins/neotree.nix
  ];
}
