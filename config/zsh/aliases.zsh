alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias myip "dig +short myip.opendns.com @208.67.222.222 2>&1"

alias q=exit
alias clr=clear
alias please='sudo '
alias rm='rm -i'
alias purge='rm -rf'
alias cp='cp -rv'
alias mv='mv -v'
alias mkdir='mkdir -p'
alias wget='wget -c'
alias cat='bat -Pp'
# alias find='fd'
alias replace='sd'
alias cdd='cd $XDG_CONFIG_HOME/dotfiles'
alias cds='cd /etc/nixos'

alias mk=make
alias rcp='rsync -vaP --delete'
alias rmirror='rsync -rtvu --delete'
alias gurl='curl --compressed'
alias disks='lsblk -o name,label,mountpoint,size,uuid'

alias clipin='xclip -sel clip -i'
alias clipout='xclip -sel clip -o'

alias colorpick="print '\nPicking color in 5 seconds...\n' && sleep 5 && colorpicker --short --one-shot | tr -d '\n' | xclip -sel clip && xclip -sel clip -o"

# ugly yet beautiful...hacky for sure
alias viewdeps='(){ nix-env -iA nixos.$1 --dry-run ;}'
alias inst='(){ nix-env -iA nixos.$1 ;}'
alias viewinst='nix-env --query --installed'

# edit zshrc
alias zshconfig="$EDITOR ~/.zshrc"
# source zshrc
alias zshsource="source ~/.zshrc"
# alias to scan wireless network for connected devices
alias scan="sudo nmap -sn 192.168.8.0/24 | sed -e 's#.*for \(\)#\1#' | sed '/^Host/d' | sed '/MAC/{G;}'"
# find largest files in directory
alias ducks="sudo du -cks -- * | sort -rn | head"
# rm EXIF data from images in directory
alias rmexif='exiftool -all='
alias top='gotop'

alias us=systemctl
alias s='sudo systemctl'
alias j=journalctl
alias r='us restart'
alias hey='sudo sh -c "cd /etc/nixos;nix-shell --run \"hey $*\""'

if command -v exa >/dev/null; then
  alias exa="exa --group-directories-first";
  alias l="exa -1";
  alias ll="exa -lg";
  alias la="LC_COLLATE=C exa -la";
fi

autoload -U zmv

take() {
  mkdir "$1" && cd "$1";
}; compdef take=mkdir

zman() {
  PAGER="less -g -I -s '+/^       "$1"'" man zshall;
}
