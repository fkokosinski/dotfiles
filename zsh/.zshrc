autoload -U add-zsh-hook

zle-line-init zle-keymap-select () {
    case "$KEYMAP" in 
        main)
            RPROMPT="%B%F{blue}[INSERT]%f%b"
            echo -ne '\e[3 q'
            ;;
        vicmd)
            RPROMPT="%B%F{green}[NORMAL]%f%b"
            echo -ne '\e[1 q'
            ;;
    esac
    zle reset-prompt
}

PROMPT="%B%F{green}%n@%m %F{blue}%~ %# %f%b"
bindkey -v

precmd () {
    RPROMPT=""
}

zle -N zle-line-init
zle -N zle-keymap-select

KEYTIMEOUT=10

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000

setopt appendhistory
setopt sharehistory
setopt incappendhistory

bindkey '^r' history-incremental-search-backward

# move hjkl one to the right by one
bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'k' down-line-or-history
bindkey -M vicmd 'l' up-line-or-history
bindkey -M vicmd ';' vi-forward-char

bindkey -M viins -s 'jk' '\e'

# allow removing chars before insert point
bindkey "^?" backward-delete-char

# aliases
alias ls='ls --color'
alias vim='nvim'

function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd
