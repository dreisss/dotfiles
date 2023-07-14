{ ... }:

{
  imports = [
    ./gh.nix
  ];

  programs.git = {
    enable = true;

    userName = "Davi Reis";
    userEmail = "dreisss026@gmail.com";

    aliases = {
      st = "status -sb";
      sl = "show --name-only";

      ll = "log --oneline";
      lg = "log --pretty=format:'%Cred%h%Creset %C(bold)%cr%Creset %Cgreen<%an>%Creset %s' --max-count=10";
      gl = "log --pretty=format:'%Cred%h%Creset %C(bold)%cr%Creset %Cgreen<%an>%Creset %s' --max-count=25 --graph";
      graph = "log --graph";

      cs = "commit -m";
      ca = "commit --amend";
      ac = "commit --amend --no-edit";

      co = "checkout";
      cm = "checkout main";
      cd = "checkout dev";
      cb = "checkout -b";
      db = "branch -d";
      lb = "branch";

      pu = "push";
      pf = "push -f";
      pa = "push && push --tags";

      ud = "checkout --";
      uf = "reset HEAD --";
      uc = "reset --soft HEAD~1";

      ri = "rebase -i";
      ra = "rebase --abort";
      rc = "rebase --continue";
      td = "rebase --edit-todo";
    };

    extraConfig = {
      core = {
        fsmonitor = true;
        autocrlf = false;
        editor = "hx";
        pager = "delta";
      };

      delta = {
        navigate = true;
        light = false;
      };

      init.defaultBranch = "main";
      credential.helper = "store";
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "diff3";
      diff.colorMoved = "default";
    };
  };
}
