{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      cd = "z";
      cp = "xcp";
      rm = "rip";
      cat = "bat";
      grep = "rg";
      diff = "delta";
      find = "fd";

      eza_ = "eza --icons -s type --git";
      l = "eza_ -l --git-ignore";
      la = "eza_ -la";
      ls = "eza_ --git-ignore";
      lsa = "eza_ --git-ignore";
      lt = "eza_ -T --git-ignore";
      lta = "eza_ -Ta --git-ignore -I .git";
    };

    shellInit = ''
      set fish_greeting

      fish_config theme choose "Rosé Pine Moon"

      zoxide init fish | source
    '';
  };

  home.file =
    let
      rose-pine = pkgs.fetchFromGitHub {
        owner = "rose-pine";
        repo = "fish";
        rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
        sha256 = "sha256-bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
      };
    in
    {
      ".config/fish/themes/Rosé Pine Dawn.theme".source = "${rose-pine}/themes/Rosé Pine Dawn.theme";
      ".config/fish/themes/Rosé Pine Moon.theme".source = "${rose-pine}/themes/Rosé Pine Moon.theme";
    };
}
