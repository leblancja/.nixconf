{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 50000;
      save = 10000;
      path = "$HOME/.zhistory";
      ignoreDups = true;
      share = true;
    };
    initExtra = ''
      # Set $PATH if ~/.local/bin exists
      	if [ -d "$HOME/.local/bin" ]; then
      export PATH=$HOME/.local/bin:$PATH
      fi

      # Use emacs key bindings
      bindkey -e

      # Fuzzy find history
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # Shift-Tab to reverse menu completion
      bindkey '^[[Z' reverse-menu-complete

      # Control-Left and Control-Right for word navigation
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      # Alt-Left and Alt-Right for word navigation
      bindkey "^[[1;3D" backward-word
      bindkey "^[[1;3C" forward-word

      ${pkgs.mcfly}/bin/mcfly init zsh | source /dev/stdin

      # Run fastfetch
      #${pkgs.fastfetch}/bin/fastfetch
    '';
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza -al --color=always --group-directories-first --icons";
      la = "${pkgs.eza}/bin/eza -a --color=always --group-directories-first --icons";
      ll = "${pkgs.eza}/bin/eza -l --color=always --group-directories-first --icons";
      lt = "${pkgs.eza}/bin/eza -aT --color=always --group-directories-first --icons";
      "l." = "${pkgs.eza}/bin/eza -ald --color=always --group-directories-first --icons .*";
      cat = "${pkgs.bat}/bin/bat --style header --style snip --style changes --style header";
      tarnow = "tar -acf";
      untar = "tar -zxvf";
      wget = "wget -c";
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";
      grep = "grep --color=auto";
      fgrep = "grep -F --color=auto";
      egrep = "grep -E --color=auto";
      ip = "ip -color";
      nrebuild = "sudo nixos-rebuild switch --flake /home/jordanl/.nixconf#desktop-3070S --upgrade";
      cleanup = "sudo nix-collect-garbage -d";
      jctl = "journalctl -p 3 -xb";
      cdev = "cd ~/Extra/dev";
      nupdate = "nix flake update --flake /home/jordanl/.nixconf";
    };
    plugins = [
      {
        name = "zsh-history-substring-search";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "v1.0.2";
          sha256 = "0y8va5kc2ram38hbk2cibkk64ffrabfv1sh4xm7pjspsba9n5p1y";
        };
      }
    ];
  };
}
