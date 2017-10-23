#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Before
plugins=(bundler tmux $plugins)

# Customize to your needs...
#
# After

# define your own aliases or override those provided by YADR.
# alias ls='ls -lAhFG'
alias ls='exa -l'
alias hosts='sudo vim /private/etc/hosts'
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias b='bundle exec'
alias gdc='git diff --cached -w'
alias dockerinit='$(boot2docker shellinit)'
alias pingg='ping 8.8.8.8'
alias v='vagrant'
alias emacs='open -a /Applications/Emacs.app $1'
alias libreoffice='/opt/homebrew-cask/Caskroom/libreoffice/5.0.1/LibreOffice.app/Contents/MacOS/soffice'
alias p3='python3'
alias p='python'
# alias python='/usr/local/bin/python3'
# alias python2='/usr/bin/python'
alias rewifi='networksetup -setairportpower airport off &&  networksetup -setairportpower airport on'
alias gdmb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias steam="cd ~/Library/Application\ Support/Steam/steamapps/common"

# ZSH editing and reloading
alias rzsh='source ~/.zshrc'
alias ezsh='vim ~/.zshrc'
alias tmuxsel='~/tmux.start.sh'

alias servedir='ruby -run -e httpd . -p 9091'

# youtube() { youtube-dl --output ~/Downloads/%(title)s.%(ext)s --extract-audio --audio-format mp3 --audio-quality=320k $1; }
# youtube() { youtube-dl --output ~/Current/%(title)s.%(ext)s --extract-audio --audio-format mp3 --audio-quality=320k $1; }
youtube() { youtube-dl --output ./%(title)s.%(ext)s --extract-audio --audio-format mp3 --audio-quality=320k $1; }
video() { youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' '$1'; }

# set or override options. two of my favorite are below.

# Automatically cd to frequently used directories http://robots.thoughtbot.com/post/10849086566/cding-to-frequently-used-directories-in-zsh
setopt auto_cd
cdpath=($HOME/Coding $HOME/Work/HealthSamurai)

# Fancy globbing http://linuxshellaccount.blogspot.com/2008/07/fancy-globbing-with-zsh-on-linux-and.html
setopt extendedglob

# Лечение глюка, когда при нажатии Backspace вместо ожидаемого удаления символа происходит отображение пробела
TERM=xterm
# export TERM=xterm-256color

# Определяем PATH
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin
# export PATH=/Users/bazzy/bin:$PATH
#
#
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH=$PYENV_ROOT/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:$PATH

# rbenv hacks
# export RBENV_ROOT=/usr/local/var/rbenv
# eval "$(rbenv init -)"

# clojure hack
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

#crystal-lang dependency
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

#
# only init if installed.
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)" >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# jump to recently used items
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump

# The fuck
eval "$(thefuck --alias)"

#bind C-] to copy current command line comand to clipboard
# bindkey '^]' "\C-e\C-u pbcopy <<"EOF"\n\C-y\nEOF\n"'
pb-kill-whole-line () {
  # zle beginning-of-line
  zle kill-whole-line
  # zle kill-line
  echo -nE $CUTBUFFER | pbcopy
  # echo $(CUTBUFFER)
  # pbcopy <<"EOF\n\C-y\nEOF\n"
}
zle -N pb-kill-whole-line
bindkey '^U' pb-kill-whole-line

# added by travis gem
[ -f /Users/bazzy/.travis/travis.sh ] && source /Users/bazzy/.travis/travis.sh

# eval "$(pyenv init -)"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
