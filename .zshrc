### Set default editor to nano (don't judge me...) ###
export VISUAL=nano
export EDITOR="$VISUAL"

### Add git branch to zsh prompt ###
# https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on branch %b'
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

### Aliases ###
alias ls="ls -A"
alias ll="ls -AlF"
alias pname="ps aux | grep"
alias wai="clear; pwd; ls"

### Functions ###
function cd () {
    builtin cd "$@";

    # Rename the current tab
    THISDIR=$(echo $PWD | awk -F "/" '{print $NF}');
    printf "\e]1;$THISDIR\a";
}

function killname () {
    # Find the PIDs that match
    ps aux | grep $1 | grep -v grep | awk '{ print $2 }' | while read line; do
        # Kill each PID
        sudo kill -9 $line;
    done
}

function encrypt_openssl () { openssl aes-256-cbc -k $DECRYPT_PASSWORD -in "$1" -out "$1".enc; }
function decrypt_openssl () { openssl aes-256-cbc -k $DECRYPT_PASSWORD -in "$1".enc -out "$1" -d; }

### Git Branch Autocomplete (requires git-completion to be installed)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
