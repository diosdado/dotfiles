fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# disable  'vi' mode
bindkey -e

# disable esc keybindings
f 'vi' modeunction do-nothing() {}
zle -N do-nothing
bindkey '^[' do-nothing
KEYTIMEOUT=1

autoload -U colors && colors


export TERM=xterm-256color
export PATH=~/.composer/vendor/bin:$PATH
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH=~/.local/bin/:$PATH
export EDITOR=nvim
export VISUAL="$EDITOR"


# coloring man pages
export MANPAGER="LESS_TERMCAP_mb=$'\e[1;31m' LESS_TERMCAP_md=$'\e[1;31m' LESS_TERMCAP_me=$'\e[0m' LESS_TERMCAP_se=$'\e[0m' LESS_TERMCAP_so=$'\e[1;33;44m' LESS_TERMCAP_ue=$'\e[0m' LESS_TERMCAP_us=$'\e[4;1;32m' LESS_TERMCAP_mr=$'\e[7m' LESS_TERMCAP_mh=$'\e[2m' LESS_TERMCAP_ZN=$'\e[74m' LESS_TERMCAP_ZV=$'\e[75m' LESS_TERMCAP_ZO=$'\e[73m' LESS_TERMCAP_ZW=$'\e[75m' less -s -M +Gg"

# aliases
alias usage="du -h -d 1 | sort -hr"
alias manzsh="man zshbuiltins"
alias manzsha="man zshall"
alias so="source ~/.zshrc" # reload zshrc
alias brewout="brew outdated --formulae | grep -f <(brew leaves)"
alias md="~/.scripts/markdown/render.sh"
alias lr="~/.scripts/laravel-reset.sh" # reset laravel
alias tetris="tetriscurses -h"

# override commands
alias mmysql="/Applications/MAMP/Library/bin/mysql"
alias mmysqldump="/Applications/MAMP/Library/bin/mysqldump"
alias bttcli="/Applications/BetterTouchTool.app/Contents/SharedSupport/bin/bttcli"
alias more="less"
alias c="clear"
alias vi="nvim"
alias ll="ls -plah --color=auto"
alias lo="find . -maxdepth 1 -exec gstat -c '%a %n' {} \\;"

# tmux sessions
alias ta="tmux attach"
alias tf="~/.scripts/tmux/tmuxifier-load.sh" # select tmuxifier layouts
alias ts="~/.scripts/tmux/tmux-sessionizer.sh" # load session with simple layout
alias tss="~/.scripts/tmux/tmux-sessionizer.sh -s" # load session with sass compiler
alias th="tmuxifier load-session ~/.tmuxifier/layouts/home.session.sh" # load home session
alias td="tmuxifier load-session ~/.tmuxifier/layouts/dotfiles.session.sh" # load dotfiles session


# load plugins
if type brew &>/dev/null; then
    FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi


# fzf
eval "$(fzf --zsh)"
eval "$(tmuxifier init -)"

# history setup
SAVEHIST=100000
HISTSIZE=100000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

autoload -Uz tetriscurses




# source cargo compiler
. "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/pl10k/.p10k.zsh.
[[ ! -f ~/dotfiles/pl10k/.p10k.zsh ]] || source ~/dotfiles/pl10k/.p10k.zsh


export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOMEBREW_PREFIX/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh





