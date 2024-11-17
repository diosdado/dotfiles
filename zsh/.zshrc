# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export TERM=xterm-256color
export PATH=~/.composer/vendor/bin:$PATH

# aliases
alias phpactor="~/.local/bin/phpactor"
alias so="source ~/.zshrc" # reload zshrc
alias ls="ls --color=auto" # always color ls output
alias larareset="~/.scripts/laravel-reset.sh" # reset laravel
alias wsass="sass --watch sass:css assets/sass:assets/css public/assets/sass:public/assets/css" # whatch sass

# tmux shortcuts
alias ta="tmux attach"
alias tw="~/.scripts/tmux-sessionizer.sh -d ~/Scriptable" # Scriptable widgets
alias td="~/.scripts/tmux-sessionizer.sh -d ~/dotfiles" # dotfiles
alias th="tmux new-session -s home -c ~/" # home
alias tss="~/.scripts/tmux-sessionizer.sh" # nvim & terminal
alias tssh="~/.scripts/tmux-sessionizer.sh -d ~/mounted-sshfs" # nvim & terminal with mounted ssh
alias tsss="~/.scripts/tmux-sessionizer.sh -s" # nvim, terminal & sass compiler

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


