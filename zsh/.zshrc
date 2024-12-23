# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# disable  'vi' mode
bindkey -e


export TERM=xterm-256color
export PATH=~/.composer/vendor/bin:$PATH
export EDITOR=nvim
export VISUAL="$EDITOR"


# aliases
alias phpactor="~/.local/bin/phpactor"
alias so="source ~/.zshrc" # reload zshrc
alias wsass="sass --watch sass:css assets/sass:assets/css public/assets/sass:public/assets/css" # watch sass
alias larareset="~/.scripts/laravel-reset.sh" # reset laravel
alias mount-fs="~/.scripts/mount-fs.sh"
alias umount-fs="~/.scripts/umount-fs.sh"
alias ts="~/.scripts/tmux/tmux-sessionizer.sh"
alias ta="tmux attach"
alias th="ts -d ~/"


# reference to the mamp mysql installation
alias mmysql="/Applications/MAMP/Library/bin/mysql"
alias mmysqldump="/Applications/MAMP/Library/bin/mysqldump"


# override commands
alias ls="ls -plah --color=auto"
alias more="less"


# load plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi


# fzf
eval "$(fzf --zsh)"


# history setup
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify




