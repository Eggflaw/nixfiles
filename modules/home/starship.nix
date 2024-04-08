{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true; 
    settings = {
      command_timeout = 1000;

      format = lib.concatStrings [
        "[](bg:black fg:blue)"
        "$os"
        "$username"
        "[](fg:blue bg:green)"
        "$git_branch"
        "$git_status"
        "[](fg:green bg:red)"
        "$directory"
        "[](fg:red bg:black)"
        "$time"
        "$sudo"
        "$nix_shell"
        "\n$character"
      ];

      character = {
        success_symbol = "[→](bold green)";
        error_symbol = "[✗](bold red)";
      };

      os = {
        disabled = false;
        style = "bold bg:blue fg:black";
        symbols = {
          Arch = " ";
          NixOS = " ";
        };
      };

      username = {
        format = "[$user ]($style)";
        style_root = "bold bg:blue fg:black";
        style_user = "bold bg:blue fg:black";
        show_always = true;
      };

      directory = {
        style = "bold fg:black bg:red";
        format = "[ $path]($style)";
        truncation_symbol = "../";
        home_symbol = " ";
      };

      git_branch = {
        style = "bold fg:black bg:green";
        symbol = "";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bold fg:black bg:green";
        format = "[ $all_status$ahead_behind ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:white";
        format = "[ 󰥔 $time ]($style)";
      };

      sudo = {
        style = "fg:white";
        symbol = "󱑷 ";
        disabled = false;
        format = "[ $symbol ]($style)";
      };

      nix_shell = {
        symbol = "󱄅 ";
        style = "white";
        format = "[ $symbol($state) ]($style)";
      };
    };
  };
}
