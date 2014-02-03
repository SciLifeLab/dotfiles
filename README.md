dotfiles
========

Config files for the various programs we use at scilifelab, grouped by directory.

Each of these files should go under your home directory and have a "." in front of them; so e.g. `tmux/mario.tmux.conf` would become `/home/mario/.tmux.conf` on UPPMAX or whichever other *nix environment.

I would suggest you build your own config files, taking from these ones the pieces you like, but if you'd like to clone the repo and just use these you can type e.g.:

```
-bash-4.1$ git clone https://github.com/SciLifeLab/dotfiles.git ~
-bash-4.1$ cp ~/dotfiles/tmux/mario.tmux.conf ~/.tmux.conf
```

We encourage contributions and if you'd like to contribute to the repo please fork it to your own github account and make a pull request from there.
