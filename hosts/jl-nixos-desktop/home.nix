{  config, pkgs, lib, ... }: 

{
  home = {
    username = "jordanl";
    homeDirectory = "/home/jordanl";
    stateVersion = "24.11";
    
    packages = with pkgs; [
      eza
      bat
      mcfly
      fastfetch
      vscode
      obsidian
      go
      typescript
      jdk
      ranger
      python3
      nodejs_22
      slack
      lazygit
      gcc
      ripgrep
      fd
      kitty
      kittysay
      gnumake
      cargo
      ruby
      kanagawa-gtk-theme
      kanagawa-icon-theme
      gnome-tweaks
      rebar3
      docker
      docker-compose
      gtk-engine-murrine
      gnome-themes-extra
      prismlauncher
      reaper
      godot_4
	  itch
    ];
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
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
			${pkgs.fastfetch}/bin/fastfetch
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
			rebuild = "sudo nixos-rebuild switch";
			cleanup = "sudo nix-collect-garbage -d";
			jctl = "journalctl -p 3 -xb";
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

	programs.starship = {
		enable = true;
		enableZshIntegration = true;
		settings = {
		  "$schema" = "https://starship.rs/config-schema.json";

		  format = lib.concatStrings [
				"[ ](color_red)"
				"$os"
				"$username"
				"[ ](bg:color_orange fg:color_red)"
				"$directory"
				"[ ](fg:color_orange bg:color_aqua)"
				"$git_branch"
				"$git_status"
				"[ ](fg:color_aqua bg:color_blue)"
				"$c"
				"$rust"
				"$golang"
				"$nodejs"
				"$php"
				"$java"
				"$kotlin"
				"$haskell"
				"$python"
				"[ ](fg:color_blue bg:color_bg3)"
				"$docker_context"
				"$conda"
				"[ ](fg:color_bg3 bg:color_bg1)"
				"$time"
				"[ ](fg:color_bg1)"
				"$line_break$character"
		  ];
		  palette = "kanagawa";

		  palettes.kanagawa = {
				color_fg0 = "#DCD7BA";  # Light text color
				color_fg1 = "#2A2A37";
        		color_bg1 = "#2A2A37";  # Slightly lighter dark background (reverted)
	 			color_bg3 = "#363646";  # Kept as is
        		color_blue = "#5D87C7";
				color_aqua = "#4D7B72";
				color_green = "#98BB6C";
				color_orange = "#E46826";  # Darker orange for better contrast
				color_purple = "#957FB8";
				color_red = "#D84141";  # Kept the brighter red
				color_yellow = "#E6C384";		      
			};

		  os = {
				disabled = false;
				style = "bg:color_red fg:color_fg0";
				symbols = {
					Windows = "󰍲";
					Ubuntu = "󰕈";
					SUSE = "";
					Raspbian = "󰐿";
					Mint = "󰣭";
					Macos = "󰀵";
					Manjaro = "";
					Linux = "󰌽";
					Gentoo = "󰣨";
					Fedora = "󰣛";
					Alpine = "";
					Amazon = "";
					Android = "";
					Arch = "󰣇";
					Artix = "󰣇";
					EndeavourOS = "";
					CentOS = "";
					Debian = "󰣚";
					Redhat = "󱄛";
					RedHatEnterprise = "󱄛";
					Pop = "";
				};
		  };

		  username = {
				show_always = true;
				style_user = "bg:color_red fg:color_fg0";
				style_root = "bg:color_red fg:color_fg0";
				format = "[ $user ]($style)";
		  };

		  directory = {
				style = "fg:color_fg0 bg:color_orange";
				format = "[ $path ]($style)";
				truncation_length = 3;
				truncation_symbol = "…/";
				substitutions = {
			  	Documents = "󰈙 ";
			  	Downloads = " ";
			  	Music = "󰝚 ";
			  	Pictures = " ";
			  	Developer = "󰲋 ";
				};
		  };

		  git_branch = {
				symbol = "";
				style = "bg:color_aqua";
				format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
		  };

		  git_status = {
				style = "bg:color_aqua";
				format = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";
		  };

			nodejs = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  c = {
				symbol = " ";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  rust = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  golang = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  php = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

			java = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
			};

		  kotlin = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  haskell = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
		  };

		  python = {
				symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
			};

			docker_context = {
				symbol = "";
				style = "bg:color_bg3";
				format = "[[ $symbol( $context) ](fg:#7E9CD8 bg:color_bg3)]($style)";
		  };

		  conda = {
				style = "bg:color_bg3";
				format = "[[ $symbol( $environment) ](fg:#7E9CD8 bg:color_bg3)]($style)";
		  };

		  time = {
				disabled = false;
				time_format = "%R";
				style = "bg:color_bg1";
				format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
		  };

		  line_break.disabled = false;

		  character = {
				disabled = false;
				success_symbol = "[](bold fg:color_green)";
				error_symbol = "[](bold fg:color_red)";
				vimcmd_symbol = "[](bold fg:color_green)";
				vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
				vimcmd_replace_symbol = "[](bold fg:color_purple)";
				vimcmd_visual_symbol = "[](bold fg:color_yellow)";
		  };
		};
	};	
	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.git = {
		enable = true;
		userName = "leblancja";
		userEmail = "leblancja@outlook.com";
	};

	gtk = {
		enable = true;
		theme = {
			name = "Kanagawa-BL";
			package = pkgs.kanagawa-gtk-theme;
			
		};
		iconTheme = {
			name = "Kanagawa";
			package = pkgs.kanagawa-icon-theme;
		};
	};


	programs.neovim = {
		enable = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = [
        pkgs.vimPlugins.nvim-treesitter
      ];
   };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

}
