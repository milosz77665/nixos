{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = true;

      format = "$directory$git_branch$git_status$line_break$character";

      directory = {
        truncation_length = 1;
        truncate_to_repo = false;
        format = "[$path](bold cyan)";
      };

      git_branch = {
        format = " [on](white) [$branch](bold purple)";
        ignore_branches = ["HEAD"];
      };

      git_status = {
        format = " $ahead_behind";
        ahead = "[\${count}](blue)[⇡](white)";
        behind = "[\${count}](yellow)[⇣](white)";
        diverged = "[\${ahead_count}](blue)[⇡](white) [\${behind_count}](yellow)[⇣](white)";
        up_to_date = "";
      };

      character = {
        success_symbol = "[❯](bold green) ";
        error_symbol = "[❯](bold red) ";
      };
    };
  };
}

