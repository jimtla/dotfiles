set -x PATH $PATH ~/bin
set -x PATH $PATH ~/installed/arcanist/bin
set -x PATH $PATH /Applications/Postgres93.app/Contents/MacOS/bin
set -x PATH $PATH /Applications/Postgres.app/Contents/Versions/9.3/bin
set -x PATH $PATH ~/.rbenv/bin
rbenv init - > /dev/null

set -x EDITOR vim

set -x GOPATH $GOPATH ~/programs/go/workspace
set -x PATH $PATH ~/programs/go/workspace/bin

# Prompt
function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

# Keybindings
function fish_user_key_bindings
    # HACK(jim): I have \cj bound to f7 in iterm2 because \cj is indistinguisable
    # from enter in fish
    bind -k f7 down-or-search 
    bind \ck up-or-search
    bind \ch backward-char
    bind \cl forward-char
    bind \cp 'commandline ""'
end




# Git
alias gs "git status"
alias gc "git checkout"
complete -x -c gc -d "Branch" -a "(git branch | cut -b 3-)"
alias gr "git rebase"
alias grc "git rebase --continue"
alias grm "git rebase origin/master"
alias gf "git fetch"
alias gd "git diff"
alias gb "git checkout -b"
alias gl "git log --all --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"

# Use macvim's terminal version for vim
alias vim /Applications/MacVim.app/Contents/MacOS/Vim

# Functions added by save
source ~/.config/fish/incl/save.fish
source ~/.config/fish/incl/env.fish

# Docker Automatic Setup
set -x DOCKER_CERT_PATH ~/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
set -x DOCKER_HOST tcp://192.168.59.103:2376

