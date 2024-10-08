
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$path


# -------------------------------------------------------------------------------------------
# Powerlevel10k
# -------------------------------------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# -------------------------------------------------------------------------------------------
# oh-my-zsh
# -------------------------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZLE_RPROMPT_INDENT=0
ZSH_THEME="powerlevel10k/powerlevel10k"
# KEYTIMEOUT=2000
plugins=(git)

source $ZSH/oh-my-zsh.sh

# alias vim="/opt/homebrew/bin/nvim"


# -------------------------------------------------------------------------------------------
# Powerlevel10k source
# -------------------------------------------------------------------------------------------

source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# -------------------------------------------------------------------------------------------
# fzf
# -------------------------------------------------------------------------------------------

eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export PATH="$HOME/.tmuxifier/bin:$PATH"


# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# -------------------------------------------------------------------------------------------
# Tmuxifier
# -------------------------------------------------------------------------------------------

eval "$(tmuxifier init -)"

alias so="source ~/.zshrc"
alias ta="tmux attach"
alias td="~/.scripts/tmux-sessionizer.sh ~/dotfiles"
alias tn="~/.scripts/tmux-sessionizer.sh ~/Notes"
alias tss="~/.scripts/tmux-sessionizer.sh"

alias t-c="~/.scripts/tmux-sessionizer.sh ~/Desktop/Projects/Design/Sandox/repo/Copywriting"
alias t-s="tmuxifier load-session sandox"



# -------------------------------------------------------------------------------------------
# Conda
# -------------------------------------------------------------------------------------------


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


