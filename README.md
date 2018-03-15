Environment Preferences
==========

This is a place where I keep bash aliases, custom functions, and other preferences so that I can easily use keep them up-to-date across different environments.

To get started, begin by cloning this repo:

`cd ~/; git clone https://github.com/RevolutionTech/env-prefs.git`

---

To add the aliases and custom functions, add the following to your shell startup file (`~/.bashrc`, `~/.profile`, etc.):

`source ~/env-prefs/.bash_alias`

Then source the shell startup file:

`source ~/.bashrc`

---

To add a user-wide `.pylintrc` configuration file, first install the custom checkers:

```
$ pip install sentry-stack-checker
$ cd ~/
$ git clone git@github.com:infoscout/isc-style-guide.git
```

Then, add `~/isc-style-guide/isc_style_guide/checkers` to the `PYTHONPATH` environment variable used by your editor.

Finally, symlink the configuration file:

`ln -s ~/env-prefs/.pylintrc ~/`

Feel free to contribute by adding your own helpful aliases and custom functions that others may find useful. Please note that I use this repo in conjunction with other private repos so that aliases or configurations that are strictly used in specific environments are not included here.
