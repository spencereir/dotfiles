setopt PROMPT_SUBST
setopt appendhistory autocd extendedglob
unsetopt beep notify

branch_colour() {
    if git diff-index --quiet HEAD -- 2>/dev/null;
    then
        colour="green"
    else
        colour="red"
    fi
    echo -ne $colour
}

num_upstream() {
    upstream=$(git rev-list HEAD..origin --count 2>/dev/null)
    if [ "$upstream" -ne "0" ];
    then
        if [ "$upstream" -ne "0" ];
        then
            echo -ne " %F{yellow}1 commit downstream%f"
        else
            echo -ne " %F{yellow}$upstream commits downstream %f"
        fi
    fi
}

get_hostname() {
    hn=$(hostname)
    if [ "$hn" != "shanghai" ];
    then
        echo -ne "@$hn"
    else
        echo -ne ""
    fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="%n\$(get_hostname) %~ $ "
RPS1="%F{\$(branch_colour)}\$(parse_git_branch)%f\$(num_upstream)"
