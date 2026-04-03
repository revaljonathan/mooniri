# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ "$TERM_PROGRAM" != "vscode" ]]; then
 #   fastfetch
#fi

echo "\033[1;32m$(whoami)\033[0m on \033[1;34m$(hostname)\033[0m with \033[1;33m$(uname -r)\033[0m " 
echo "alive for \033[0;36m$(uptime -p|sed 's/^up //')\033[0m"
echo " "

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

# BASIC ENV & KEYBIND
#zmodload zsh/zprof
#export TERM=xterm-256color
export LS_COLORS=""
export BAT_THEME="tokyonight_moon"
export "MICRO_TRUECOLOR=1"
export EZA_CONFIG_DIR="$HOME/.config/eza/"
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export COLORTERM=truecolor


export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history


setopt auto_cd
setopt interactive_comments
setopt multios
setopt histexpand

arch_news_check() {
    echo "🔔 Latest Arch Linux news:"
    curl -s https://archlinux.org/news/ \
      | grep -Eo 'href="/news/[^"]+"' \
      | cut -d'"' -f2 \
      | head -n 5 \
      | sed 's|^|https://archlinux.org|'
}

color_check() {
for i in {0..255}; do
        printf "\e[48;5;%sm%3d " "$i" "$i"
    if (( (i + 1) % 16 == 0 )); then
        printf "\e[0m\n"
    fi
done
}


# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    zsh-autosuggestions
    sudo
    zsh-syntax-highlighting
)

skip_global_compinit=1                          
autoload -Uz compinit 
if [[ -n /tmp/zcompdump-$USER(#qN.mh+24) ]]; then
  compinit -d /tmp/zcompdump-$USER
else
  compinit -C -d /tmp/zcompdump-$USER
fi

source $ZSH/oh-my-zsh.sh

# COMPLETION BEHAVIOR
zstyle ':completion:*' menu select
setopt AUTO_MENU
unsetopt MENU_COMPLETE

# nicer matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# AUTOSUGGESTIONS
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# SYNTAX HIGHLIGHTING
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#     ___   ___                
#    / _ | / (_)__ ____ ___ ___
#   / __ |/ / / _ `(_-</ -_|_-<
#  /_/ |_/_/_/\_,_/___/\__/___/

# SYSTEM
alias up='paru -Syu'
alias clean='sudo paccache -rk2 && paru -c'
alias pacnews='arch_news_check'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias zshnew='source ~/.zshrc'
alias gmn='npx @google/gemini-cli'

# POWER
alias sn='shutdown now'
alias sp='systemctl suspend'
alias rb='reboot'

# DISPLAY / GPU
alias turbon='echo 0 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo && sleep 1 && checktur'
alias turboff='echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo && sleep 1 && checktur'
alias checktur='echo "Turbo boost: $(if [ $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) -eq 0 ]; then echo "ON"; else echo "OFF"; fi)"'

# GIT
alias gs='la && git status'
gacp() {
  if [ -z "$1" ]; then
    echo "isi commit message dulu njinggs"
    return 1
  fi
  git add .
  git commit -m "$1"
  git push
}

# EDITORS
alias nano='micro'
alias vim='nvim'
alias nv='nvim'
alias mic='micro'
alias code='visual-studio-code-electron'

# FILE VIEWERS
alias see='bat'
alias view='gwenview'
alias zat='zathura'
take() {
  mkdir -p "$1" && cd "$1"
}


# NAVIGATION
alias docs='cd Documents'
alias rice='cd Rice'
alias uni='cd uniStuff'
alias dl='cd Downloads'
alias sz='du -sh * | sort -h'
alias y='yazi'
unalias ls
alias ls='eza -l -h --sort=modified --reverse --color=always --icons --git --group-directories-first'
alias lss='eza -l -h --sort=modified --reverse --color=always --icons --git --group-directories-first -G'
alias la='ls -A'
alias lsa='la -G'
alias lt='ls -T'
alias rm='rm -I'
alias x='exit'
alias c='clear'
alias lc='ls -s Extension'
alias cd='z'
# SHELL UTILS
alias color='color_check'
alias grep='rg --color=auto --line-number --smart-case'

fuck() { sudo $(fc -ln -1) }
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *) echo "Format tolol." ;;
    esac
  else
    echo "mana filenya su."
  fi
}


# FETCH / INFO
alias morefetch='fastfetch -c ~/.config/fastfetch/morefetch.jsonc'
alias clock='tty-clock -s -c -C 5'

# FUN
alias aq='asciiquarium'
alias pipes='pipes.sh'
alias q='fortune | cowsay -r'
alias plis='sudo'
weather() {
  curl wttr.in/"$1"
}
alias udanraksu='weather semarang'

eval "$(zoxide init zsh)"
f() { eval $(thefuck $(fc -ln -1)); }

#zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet



export PATH=$PATH:/home/revalbtw/.spicetify
