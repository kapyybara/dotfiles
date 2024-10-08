if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# Rust cargo
set -gx PATH "$HOME/.cargo/bin" $PATH
# end

# Nvm Node
set --universal nvm_default_version v20
nvm use
# end

# pnpm
set -gx PNPM_HOME "/home/iwku/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
alias pn=pnpm
# end

# Golang
set -gx GO_HOME /usr/local/go/bin
set -gx PATH "$GO_HOME" $PATH
# end

# Default config for prettierd
set -u PRETTIERD_DEFAULT_CONFIG "/home/iwku/.config/nvim/plugin.prettierrc.json"
# end

# The fuck 
function fuck -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
    if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge ^ /dev/null
    end
end
# end

# deno
export DENO_INSTALL="/home/samsa/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Alias
alias vi nvim
alias pn pnpm
alias python python3
alias lpdc "cp /home/iwku/.config/nvim/default_var/.prettierrc ./"
alias dk docker
alias dkll "docker ps"
alias dkla "docker ps -a"
alias dks "docker start"


# git
alias ga "git add"
alias gc "git commit -m"
alias gp "git push"
alias gb "git branch"
alias gco "git checkout"
# end

# Power
alias pwoff "shutdown now"

# 1.1.1.1
alias 1.1 "warp-cli connect"
alias 1.0 "warp-cli disconnect"

alias rm "rm -i"
alias top bpytop
alias nf neofetch


starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/samsa/anaconda3/bin/conda
    eval /home/samsa/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/samsa/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/samsa/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/samsa/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

