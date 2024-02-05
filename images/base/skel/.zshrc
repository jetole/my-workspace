neofetch

export ZSH="/opt/oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the followin line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set tmux to auto start
export ZSH_TMUX_AUTOSTART=true

ZSH_TMUX_AUTOSTART_ONCE=true

# Automatically connect to a previous session if it exits
export ZSH_TMUX_AUTOCONNECT=true

# Set tmux -u option to support unicode
ZSH_TMUX_UNICODE=true

# # Pyenv
# ################################################################################
# if [[ ! "$container" ]]
# then
#   export PYENV_ROOT="$HOME/.pyenv"
#   export PYENV_BIN="${PYENV_ROOT}/bin"
#   command -v pyenv >/dev/null || export PATH="$PYENV_BIN:$PATH"
#   eval "$(pyenv init -)"
#   # eval "$(pyenv virtualenv-init -)"
# fi

# ################################################################################

# This needs to be before we source the zsh-syntax-highlighting plugins
autoload -U select-word-style
select-word-style shell

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
    python
    sudo
    tmux
    command-time
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
################################################################################
export PATH=$HOME/bin:$PATH
umask 0077

# Dircolors from https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark
eval "$(dircolors "${HOME}/.dircolors.256dark")"

# Aliases
################################################################################
alias drop_cache='sudo sync && sudo sysctl -w vm.drop_caches=3'
alias drop_swap='sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo swapoff -a && sudo swapon -a'
alias ipcalc='/usr/bin/ipcalc -n'
# alias netstat='sudo /bin/netstat'
alias open='xdg-open'
# alias localenv='virtualenv --prompt "($(basename "$PWD"))" .venv; cd .'
# alias pip='pip3'
# alias whatismyip='dig myip.opendns.com @resolver1.opendns.com +short'
alias ls='/bin/ls --color -Fh'
alias docker=podman
alias docker-compose=podman-compose
# alias microk8s='sudo /snap/bin/microk8s'
# alias kubectl='sudo /snap/bin/microk8s kubectl'
# alias reload='source "${HOME}/.zshrc"'
# alias code='code-insiders'
alias bat="batcat"
alias db='distrobox'
alias cat='batcat --paging=never --style plain'
alias clean_mem='drop_swap'
alias default_branch='git checkout "$(basename "$(git symbolic-ref refs/remotes/origin/HEAD --short)")"'
alias default_branch_show='echo "$(basename "$(git symbolic-ref refs/remotes/origin/HEAD --short)")"'

# Other
################################################################################
export PIPENV_VENV_IN_PROJECT=1

# PATH="${HOME}/go/bin:$PATH"

# Cause less to not page if there is less than a page of data
export LESS='-F'

export EDITOR=nvim


# Enable starship (Should be at end)
################################################################################
eval "$(starship init zsh)"
