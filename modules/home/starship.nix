{lib, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "[](bg:black fg:blue)"
        "$os"
        "$username"
        "[](fg:blue bg:green)"
        "$git_branch"
        "$git_status"
        "[](fg:green bg:yellow)"
        "$directory"
        "[](fg:yellow bg:black)"
        "$time"
        "$sudo"
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
        style = "bold fg:black bg:yellow";
        format = "[ $path ]($style)";
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
    };
  };
}
