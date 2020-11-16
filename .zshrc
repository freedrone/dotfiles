# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

if [[ ! -d "$ZSH/custom/themes/powerlevel10k" ]]; then
    echo "p10k does not exist, cloning"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "run ' p10k configure' to install font, or go to link for manual install"
    echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
fi

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# CUSTOM EXPORTS
## BEGIN
export PLEX_HOME="/opt/plex/"
## END

# User configuration

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
setopt sharehistory
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Programs/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Programs/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Programs/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Programs/google-cloud-sdk/completion.zsh.inc"; fi
