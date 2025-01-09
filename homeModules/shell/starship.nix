{ config, pkgs, lib, ...}:

{
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
}