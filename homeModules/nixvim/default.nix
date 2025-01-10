{ pkgs, ...}:

{
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
    ./pluins/autopairs.nix
    
  ];
}
