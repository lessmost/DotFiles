# Created by newuser for 4.3.12
#

export HISTSIZE=50000
export SAVEHIST=50000

#alias sudo='sudo '
alias svim='sudo vim'
alias grep='grep --color=auto'
alias man='man -P most'
alias emacsnw='emacs -nw'
alias ew='emacs -nw'
alias ec='emacsclient'
alias view='vim -R'
alias wget='wget --no-use-server-timestamps'
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias kvm-ubuntu='kvm -hda ~/data/img/ubuntu-11.10-server-raw.img -m 512 -net nic -net user,hostfwd=tcp::5555-:22 -display none &'
alias kvm-ubuntu1104='kvm -hda ~/data/img/ubuntu-11.04-server-raw.img -m 512 -net nic -net user,hostfwd=tcp::5556-:22 -display none &'

alias create-tunel='ssh -CfN -L8249:211.69.198.249:22 root@wq; ssh -CfN -L8250:211.69.198.250:22 root@wq;'

alias ssh-server='ssh -p 8249 root@localhost'
alias ssh-client='ssh -p 8250 root@localhost'
alias ssh-xen='ssh root@xen'
alias ssh-xpv1='ssh root@xpv1'
alias ssh-wq='ssh root@wq'
alias ssh-191='luit -encoding GBK ssh root@192.168.223.191'

alias chrome-noproxy='google-chrome --enable-udd-profiles --user-data-dir=/home/lzq/.config/google-chrome-proxy 2> /dev/null &'

#alias chrome-proxy='google-chrome -proxy-server=127.0.0.1:8087 --enable-udd-profiles --user-data-dir=/home/lzq/.config/google-chrome-proxy 2> /dev/null &'

# keychain
eval `keychain --eval --agents ssh id_rsa`
