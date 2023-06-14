# Environment Preferences

This is a place where I keep bash aliases, custom functions, and other preferences so that I can easily keep them up-to-date across different environments.

To get started, begin by cloning this repo:

    cd ~
    git clone https://github.com/RevolutionTech/env-prefs.git

---

Initialize the environment with the `init.sh` script:

    ./init.sh

---

To add the aliases and custom functions, add the following to your shell startup file (eg. `~/.zshrc`):

    source ~/env-prefs/.zshrc

Then source the shell startup file:

    source ~/.zshrc

---

To use env-prefs configurations, symlink the configuration files:

    ln -s ~/env-prefs/.tmux.conf ~/

Feel free to contribute by adding your own helpful aliases and custom functions that others may find useful. Please note that I use this repo in conjunction with other private repos so that aliases or configurations that are related to private projects are not included here.
