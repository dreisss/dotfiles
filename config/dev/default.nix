{ ... }:

{
  programs.git = import ./othertools/git.nix {};
  programs.gh = import ./othertools/gh.nix {};
}
