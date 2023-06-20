#!/bin/bash

### Apply Git Config ###
git config --global format.pretty "format:%C(dim)%h%C(reset) | %C(yellow)%<(15,trunc)%an%C(reset) | %<(75,trunc)%s | %C(cyan)%<(15,trunc)%cr%C(reset)"
# git trash: stash stage and immediately drop it
git config --global alias.trash '!'"f() { git stash; git stash drop; }; f;"
