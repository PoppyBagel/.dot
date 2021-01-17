export STARSHIP_CONFIG=$HOME/.starship.toml

eval "$(starship init zsh)"
export TERM=xterm-256color

function source-if-exist { [ -e "$1" ] && source "$1" }


export PATH="$HOME/.local/bin:$PATH"

# Python stuff
export PATH="$HOME/.poetry/bin:$PATH"
export PYTHONBREAKPOINT="pudb.set_trace"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


# Misc options
setopt autocd extendedglob globdots correct histignoredups
bindkey -e
#WORDCHARS=''@"
export EDITOR="vim"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source-if-exist "$HOME/.zsh/aliases.zsh"
source-if-exist "$HOME/.zsh/history.zsh"


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Plugins
zinit light zdharma/fast-syntax-highlighting
zinit light ael-code/zsh-colored-man-pages

# Completion settings
export CASE_SENSITIVE=false
source-if-exist "$HOME/.zsh/completion.zsh"
# Initialize the completion system
autoload -Uz compinit
compinit
# zstyle ':completion:*' menu select
# zinit light zsh-users/zsh-autosuggestions

# Tilix hack to preserve working directory after window split
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
