### Set default editor to nano (don't judge me...) ###
export VISUAL=nano
export EDITOR="$VISUAL"

### Source virtualenvwrapper ###
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

# Functions for Mac only
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Activate the Terminal
    function tActivate {
        osascript -e 'tell application "Terminal" to activate' "$@"
    }
    # Open a New Tab
    function tNewtab {
        tActivate -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' "$@"
    }
    # Perform a given command in a New Tab in the Terminal
    function tCommand {
        FULLCMD=$(echo 'tell application "Terminal" to do script "'$1'" in selected tab of the front window')
        tNewtab -e "$FULLCMD"
    }
fi

### Apply Git Config ###
git config --global format.pretty "format:%C(dim)%h%C(reset) | %C(yellow)%<(15,trunc)%an%C(reset) | %<(75,trunc)%s | %C(cyan)%<(15,trunc)%cr%C(reset)"
# git trash: stash stage and immediately drop it
git config --global alias.trash '!'"f() { git stash; git stash drop; }; f;"

### Git Branch Autocomplete (requires git-completion to be installed)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
