dotfiles
========

Config files for the various programs we use at SciLifeLab.


Contribute Your Dotfiles!
-------------------------

We encourage contributions! If you'd like to contribute to the repo please fork it to your own github account and make a pull request from there. The general pattern is tool/user.configfilename. For example, Mario's `.tmux.conf` file is under `tmux/mario.tmux.conf`, and his .bashrc is under `/bash/mario.bashrc`.

Usage
-----

Each of these files should go under your home directory and have a "." in front of them; so e.g. `tmux/mario.tmux.conf` would become `/home/mario/.tmux.conf` on UPPMAX or any other *nix environment.

For the newly git initiated users out there, one way to pull all these files into your own user space would be:

```
-bash-4.1$ git clone https://github.com/SciLifeLab/dotfiles.git ~
-bash-4.1$ cp ~/dotfiles/tmux/mario.tmux.conf ~/.tmux.conf
```

Please see the very good resources listed on this page for more help with git and github: https://help.github.com/articles/what-are-other-good-resources-for-learning-git-and-github


Additional Resources
--------------------

Other useful tools commonly in use include:

_(feel free to add your own favorite tools to this list)_

  - HomeBrew (OS X): http://brew.sh/
  - BetterTouchTool (OS X): http://www.boastr.net/
  - Caffeine (OS X): http://lightheadsw.com/caffeine/
  - iTerm 2 (OS X, free): http://iterm2.com/
  - Spectacle (OS X, free): http://spectacleapp.com/
