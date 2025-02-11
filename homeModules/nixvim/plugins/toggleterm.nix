{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        size = 20;
        open_mapping = "[[<C-T>]]";
        hide_numbers = true;
        shade_terminals = true;
        shading_factor = 2;
        start_in_insert = true;
        insert_mappings = true;
        persist_size = true;
        direction = "float";
        close_on_exit = true;
        float_opts = {
          border = "rounded";
          winblend = 0;
          highlights = {
            border = "Normal";
            background = "Normal";
          };
        };
      };
    };
  };
}
